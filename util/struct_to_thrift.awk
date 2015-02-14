# 功能： 用来将表格字段自动格式化为thrift结构
# 参数： 需要提供thrift结构名 STRUCT_NAME
# 错误处理： 如生成出不完整结构，应会有"ERROR"提示错误信息
#
# usage:
# awk -f ./struct_to_thrift.awk -v STRUCT_NAME=xxx xxx.struct_txt
#
# xxx.struct_txt例子:
# _______________________________
# |# This is comment
# |# Next line is empty, continue
# |
# |KEY1 COMMENT1 TYPE1
# |
# |KEY2 COMMENT2 TYPE2
# |ps: information about KEY2
# |information about KEY2...(2)
# |information about KEY2...(3)
# |information about KEY2...(4)
# |
# |ARRAY_KEY3_[5] COMMENT3 TYPE3
# |
# -------------------------------
#
# 转换后:
# _______________________________
# |struct $STRUCT_NAME {
# |     1: TYPE1 KEY1 // COMMENT1
# |     2: TYPE2 KEY2 // COMMENT2
# |        // information about KEY2
# |        // information about KEY2...(2)
# |        // information about KEY2...(3)
# |        // information about KEY2...(4)
# |     3: TYPE3 ARRAY_KEY3_1 // COMMENT3
# |     4: TYPE3 ARRAY_KEY3_2
# |     5: TYPE3 ARRAY_KEY3_3
# |     6: TYPE3 ARRAY_KEY3_4
# |     7: TYPE3 ARRAY_KEY3_5
# |}
# -------------------------------

BEGIN {
    FS = " "
    num = 1

    type["INT32"]  = "i32"
    type["INT64"]  = "i64"
    type["String"] = "string"

    print "struct " STRUCT_NAME " {"
}

# 1. 跳过 "#" 注释
/^\#/ {
    next
}

/^[\ \t]*$/ {
    next
}

# 2. 读取 ps:
#    直到读到空行停止
/^ps:/ {
    print "        // " substr($0, 4)
    while (1)
    {
        getline
        if ($0 !~ "^$")
        {
            print "        // " $0
        }
        else
        {
            next
        }
    }
}

# 错误处理
NF < 2 {
    print "[ERROR: unavaliabel data.(NF < 2)]"
    exit(-1)
}

# 3. 处理数组
/^[_a-zA-Z0-9]+\[[0-9]+\]\ / {
    match($1, /(.*)\[(.*)\]/, a)
    len = a[2] + 0 # 转数字

    for (i = 1; i <= len; i++) {
        name = (a[1] "" i)
        if (i == 1)
            printf("    %2d: %-8s %-12s // %s\n", num++, type[$3], name, $2)
        else
            printf("    %2d: %-8s %-12s\n", num++, type[$3], name)
    }
    next
}

# 4. 正常非数组字段
{
    printf("    %2d: %-8s %-12s // %s\n", num++, type[$3], $1, $2)
}

END {
    print "}"
}
