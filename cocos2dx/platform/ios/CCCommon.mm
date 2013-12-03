/****************************************************************************
 Copyright (c) 2010 cocos2d-x.org

 http://www.cocos2d-x.org

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 ****************************************************************************/

#include "CCCommon.h"

#include <stdarg.h>
#include <stdio.h>
#include "../platform.h"

#include "../platform.h"

#import <UIKit/UIAlert.h>

NS_CC_BEGIN

/*
void CCLog(const char * pszFormat, ...)
{
	
#ifdef _AOW_NOLOG_
#else
    printf("Cocos2d: ");
    cc_timeval tt;
	CCTime::gettimeofdayCocos2d(&tt, nullptr);
	
	int nRem = tt.tv_sec;
	int n_D = nRem / (60*60*24);
	nRem = nRem - n_D * (60*60*24);
	int n_H = nRem / (60*60);
	nRem = nRem - n_H * (60*60);
	int n_M = nRem / 60;
	int n_S = nRem - n_M * 60;
	int n_US = tt.tv_usec / 1000;
	
	printf("Cocos2d %02d:%02d:%02d:%03d: ", n_H, n_M, n_S, n_US);

    char szBuf[kMaxLogLen+1] = {0};
    va_list ap;
    va_start(ap, pszFormat);
    vsnprintf(szBuf, kMaxLogLen, pszFormat, ap);
    va_end(ap);
    printf("%s", szBuf);
    printf("\n");
#endif
}
*/

void TMPLog( const char* fmt, ... ){
    static FILE* g_tmp_log_fp = NULL;
    if ( NULL == g_tmp_log_fp ){
        g_tmp_log_fp = fopen("/tmp/aow.tmplog", "a");
    }
    
    fprintf(g_tmp_log_fp, "%ld: ", time(NULL));
    
    va_list ap;
    va_start(ap, fmt);
    vfprintf(g_tmp_log_fp, fmt, ap);
    
    fprintf(g_tmp_log_fp, "\n");
    fflush(g_tmp_log_fp);
    va_end(ap);
}


void CCLog(const char * pszFormat, ...)
{
    cc_timeval tt;
	CCTime::gettimeofdayCocos2d(&tt, nullptr);
	
	int nRem = tt.tv_sec;
	int n_D = nRem / (60*60*24);
	nRem = nRem - n_D * (60*60*24);
	int n_H = nRem / (60*60);
	nRem = nRem - n_H * (60*60);
	int n_M = nRem / 60;
	int n_S = nRem - n_M * 60;
	int n_US = tt.tv_usec / 1000;
	
	printf("Cocos2d %02d:%02d:%02d:%03d: ", n_H, n_M, n_S, n_US);
    char szBuf[kMaxLogLen+1] = {0};
    va_list ap;
    va_start(ap, pszFormat);
    vsnprintf(szBuf, kMaxLogLen, pszFormat, ap);
    va_end(ap);
    printf("%s", szBuf);
    printf("\n");
}

// ios no MessageBox, use CCLog instead
void CCMessageBox(const char * pszMsg, const char * pszTitle)
{
    NSString * title = (pszTitle) ? [NSString stringWithUTF8String : pszTitle] : nil;
    NSString * msg = (pszMsg) ? [NSString stringWithUTF8String : pszMsg] : nil;
    UIAlertView * messageBox = [[UIAlertView alloc] initWithTitle: title
                                                          message: msg
                                                         delegate: nil
                                                cancelButtonTitle: @"OK"
                                                otherButtonTitles: nil];
    [messageBox autorelease];
    [messageBox show];
}

void CCLuaLog(const char * pszFormat)
{
    puts(pszFormat);
}

NS_CC_END
