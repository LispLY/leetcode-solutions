// 如果首字母小写，则全部大小写都一样；如果首字母大写，则剩下的都一样
// 本地没问题，服务器上堆内存溢出不知道为啥

#include <stdbool.h>
#include <stdio.h>

bool isCap(char c) {
    return c >='A' && c <='Z';
}

bool isAllBigOrAllSmall(char *word) {
    if (!word) return true;
    bool isFirstCap = isCap(*word);
    char *cur = ++word;
    while (*cur) {
        if(isCap(*cur++) != isFirstCap)
            return false;
    }
    return true;
}

bool detectCapitalUse(char *word){
    bool capAtFirst = isCap(*word);
    
    if (!capAtFirst) {
        return isAllBigOrAllSmall(word);
    } 
    return isAllBigOrAllSmall(word+1);
}

// test

int main() {
    bool result = detectCapitalUse("G");
    printf("result:\n");
    printf("%d", result);
}