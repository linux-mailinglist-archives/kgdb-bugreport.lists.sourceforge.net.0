Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC423D035C
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Oct 2019 00:21:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iHxrI-00058c-Lm
	for lists+kgdb-bugreport@lfdr.de; Tue, 08 Oct 2019 22:21:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iHxrH-00058U-1I
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 22:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kEPHwIm7df4PkY9cDyDlenGTWq9+YLMznzJXQKYUKZ4=; b=X6C+oO6QyqyrU9hdP+OKMOUYp8
 gHdi/xVQdRDJSKnzsJTxpTIf8wMZ0PGwmkiyoX+DUAjJASg+1nRmZwaFgUwVKgeg3TcoYP2nfCzQU
 +j3jIjiNqD0/JSxY032kRvo587FfqhEICPccWrE+zGLrgsZ2V96ePbF9IfY9qiYfeAOg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kEPHwIm7df4PkY9cDyDlenGTWq9+YLMznzJXQKYUKZ4=; b=DTL9Tw8VxSWtNg97vp5/IamO5i
 ovXYvM8eBLIwzloXkknue0HfmLLJdR87We2q7dWoulRJGTmGeXIoMkIT15tmtrdgdfUfmgy5zvnsz
 A0VGbJtN9H1Q0FzHfD/4B4St4AHDc8+83FIIVFVuEv+ZIQ4qZvCWCRk+YbaXyofG4oeM=;
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iHxrE-003NFn-LN
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 22:21:30 +0000
Received: by mail-io1-f68.google.com with SMTP id z19so606474ior.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Oct 2019 15:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kEPHwIm7df4PkY9cDyDlenGTWq9+YLMznzJXQKYUKZ4=;
 b=lTaIMlolf/hxPt/kb7S/rw6zIuIcsCPjTvfaTUUWe+7Yy0objFkVfZpVz7gcrVh9IL
 85QkDgWcunWwUU/OaLhOIKrzM3xF8NQ/eIG9jU1V+XRqDZZD3W3IvPYwTUxXrn6ct54T
 VcheOHly0sJh2wZJPTgWFzGpBR+9EUheQLnCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kEPHwIm7df4PkY9cDyDlenGTWq9+YLMznzJXQKYUKZ4=;
 b=rId9bjH76j81teH2ycLhjpH0g8Xg3v9ZamfkPiyyvS7dtZOwF1CsbGgbuNuiANqthU
 fcRB14wwFTjEa2lgOyKWwcvbLyEoiDo0+z0ov/OfxWuWr+6oXDLPa2Ddfscx+yPBEGVM
 eZtS9IkLo+QwFlmJ+BhPBPd1aYI2LNzw0o213muZWxLn9m7csouJz9fGHPW3IJoaTyVA
 ilLEC0EssybAk3aWoZxjz0Q5WHkhZflWYNAa/L9fMKw7YdkeDQU3nXr/EnkeyXqOsUeH
 aQG+tXiVITm2bhEmTIv8qUjk5qW/qoHJyLmLptCmCQmIEc4AO2tRbi4+WZKz7j65NCdY
 hFlw==
X-Gm-Message-State: APjAAAVi8stVSAvQI6P1HIoRP37bXQ9S29a0QD07Xbv4xOWV6FXJCZI7
 x4euM4OE+Z/ezT6jFky6j7SgIWSIvTw=
X-Google-Smtp-Source: APXvYqxL4DkepG3ZNnnLec3zijh1hH/SEkJUx456nXIUkJ729+kC4NCdxrSMtS+bdkZ3MP994ppWtg==
X-Received: by 2002:a92:1951:: with SMTP id e17mr38545918ilm.288.1570573282288; 
 Tue, 08 Oct 2019 15:21:22 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45])
 by smtp.gmail.com with ESMTPSA id h70sm133359iof.48.2019.10.08.15.21.21
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2019 15:21:21 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id a1so519903ioc.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Oct 2019 15:21:21 -0700 (PDT)
X-Received: by 2002:a05:6e02:683:: with SMTP id
 o3mr35457412ils.58.1570573273677; 
 Tue, 08 Oct 2019 15:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191008132043.7966-1-daniel.thompson@linaro.org>
 <20191008132043.7966-4-daniel.thompson@linaro.org>
In-Reply-To: <20191008132043.7966-4-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 8 Oct 2019 15:21:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W9Tdh2hPekzgSYnCqoTX_ms1GY-FXgnxd-uEW0SWbyuw@mail.gmail.com>
Message-ID: <CAD=FV=W9Tdh2hPekzgSYnCqoTX_ms1GY-FXgnxd-uEW0SWbyuw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iHxrE-003NFn-LN
Subject: Re: [Kgdb-bugreport] [PATCH v2 3/5] kdb: Remove special case logic
 from kdb_read()
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: kgdb-bugreport@lists.sourceforge.net, Patch Tracking <patches@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, Oct 8, 2019 at 6:21 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> kdb_read() contains special case logic to force it exit after reading
> a single character. We can remove all the special case logic by directly
> calling the function to read a single character instead. This also
> allows us to tidy up the function prototype which, because it now matches
> getchar(), we can also rename in order to make its role clearer.

nit: since you're doing the rename, should you rename
kdb_read_handle_escape() to match?


> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  kernel/debug/kdb/kdb_io.c | 56 ++++++++++++++++-----------------------
>  1 file changed, 23 insertions(+), 33 deletions(-)
>
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 78cb6e339408..a9e73bc9d1c3 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -106,7 +106,19 @@ static int kdb_read_handle_escape(char *buf, size_t sz)
>         return -1;
>  }
>
> -static int kdb_read_get_key(char *buffer, size_t bufsize)
> +/*
> + * kdb_getchar
> + *
> + * Read a single character from kdb console (or consoles).

nit: should we start moving to the standard kernel convention of
kernel-doc style comments?  See
"Documentation/doc-guide/kernel-doc.rst"


> + *
> + * An escape key could be the start of a vt100 control sequence such as \e[D
> + * (left arrow) or it could be a character in its own right.  The standard
> + * method for detecting the difference is to wait for 2 seconds to see if there
> + * are any other characters.  kdb is complicated by the lack of a timer service
> + * (interrupts are off), by multiple input sources. Escape sequence processing
> + * has to be done as states in the polling loop.

Before your paragraph, maybe add: "Most of the work of this function
is dealing with escape sequences." to give it a little bit of context.


> + */
> +static int kdb_getchar(void)

Is "int" the right return type here, or "unsigned char"?  You never
return EOF, right?  Always a valid character?  NOTE: if you do change
this to "unsigned char" I think you still need to keep the local "key"
variable as an "int" since -1 shouldn't be confused with the character
255.


>  {
>  #define ESCAPE_UDELAY 1000
>  #define ESCAPE_DELAY (2*1000000/ESCAPE_UDELAY) /* 2 seconds worth of udelays */
> @@ -124,7 +136,6 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
>                 }
>
>                 key = (*f)();
> -
>                 if (key == -1) {
>                         if (escape_delay) {
>                                 udelay(ESCAPE_UDELAY);
> @@ -134,14 +145,6 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
>                         continue;
>                 }
>
> -               if (bufsize <= 2) {
> -                       if (key == '\r')
> -                               key = '\n';
> -                       *buffer++ = key;
> -                       *buffer = '\0';
> -                       return -1;
> -               }
> -
>                 if (escape_delay == 0 && key == '\e') {
>                         escape_delay = ESCAPE_DELAY;
>                         ped = escape_data;
> @@ -183,17 +186,7 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
>   *     function.  It is not reentrant - it relies on the fact
>   *     that while kdb is running on only one "master debug" cpu.
>   * Remarks:
> - *
> - * The buffer size must be >= 2.  A buffer size of 2 means that the caller only
> - * wants a single key.

By removing this you broke "BTAPROMPT".  So doing:

set BTAPROMPT=1
bta

It's now impossible to quit out.  Not that I've ever used BTAPROMPT,
but seems like we should either get rid of it or keep it working.


> - *
> - * An escape key could be the start of a vt100 control sequence such as \e[D
> - * (left arrow) or it could be a character in its own right.  The standard
> - * method for detecting the difference is to wait for 2 seconds to see if there
> - * are any other characters.  kdb is complicated by the lack of a timer service
> - * (interrupts are off), by multiple input sources and by the need to sometimes
> - * return after just one key.  Escape sequence processing has to be done as
> - * states in the polling loop.
> + *     The buffer size must be >= 2.
>   */
>
>  static char *kdb_read(char *buffer, size_t bufsize)
> @@ -228,9 +221,7 @@ static char *kdb_read(char *buffer, size_t bufsize)
>         *cp = '\0';
>         kdb_printf("%s", buffer);
>  poll_again:
> -       key = kdb_read_get_key(buffer, bufsize);
> -       if (key == -1)
> -               return buffer;
> +       key = kdb_getchar();
>         if (key != 9)
>                 tab = 0;
>         switch (key) {
> @@ -741,7 +732,7 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
>
>         /* check for having reached the LINES number of printed lines */
>         if (kdb_nextline >= linecount) {
> -               char buf1[16] = "";
> +               char ch;

The type of "ch" should be the same as returned by kdb_getchar()?
Either "int" if you're keeping it "int" or "unsigned char"?


>                 /* Watch out for recursion here.  Any routine that calls
>                  * kdb_printf will come back through here.  And kdb_read
> @@ -776,39 +767,38 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
>                 if (logging)
>                         printk("%s", moreprompt);
>
> -               kdb_read(buf1, 2); /* '2' indicates to return
> -                                   * immediately after getting one key. */
> +               ch = kdb_getchar();
>                 kdb_nextline = 1;       /* Really set output line 1 */
>
>                 /* empty and reset the buffer: */
>                 kdb_buffer[0] = '\0';
>                 next_avail = kdb_buffer;
>                 size_avail = sizeof(kdb_buffer);
> -               if ((buf1[0] == 'q') || (buf1[0] == 'Q')) {
> +               if ((ch == 'q') || (ch == 'Q')) {
>                         /* user hit q or Q */
>                         KDB_FLAG_SET(CMD_INTERRUPT); /* command interrupted */
>                         KDB_STATE_CLEAR(PAGER);
>                         /* end of command output; back to normal mode */
>                         kdb_grepping_flag = 0;
>                         kdb_printf("\n");
> -               } else if (buf1[0] == ' ') {
> +               } else if (ch == ' ') {
>                         kdb_printf("\r");
>                         suspend_grep = 1; /* for this recursion */
> -               } else if (buf1[0] == '\n') {
> +               } else if (ch == '\n' || ch == '\r') {
>                         kdb_nextline = linecount - 1;
>                         kdb_printf("\r");
>                         suspend_grep = 1; /* for this recursion */
> -               } else if (buf1[0] == '/' && !kdb_grepping_flag) {
> +               } else if (ch == '/' && !kdb_grepping_flag) {
>                         kdb_printf("\r");
>                         kdb_getstr(kdb_grep_string, KDB_GREP_STRLEN,
>                                    kdbgetenv("SEARCHPROMPT") ?: "search> ");
>                         *strchrnul(kdb_grep_string, '\n') = '\0';
>                         kdb_grepping_flag += KDB_GREPPING_FLAG_SEARCH;
>                         suspend_grep = 1; /* for this recursion */
> -               } else if (buf1[0] && buf1[0] != '\n') {
> +               } else if (ch && ch != '\n') {

Remove "&& ch != '\n'".  We would have hit an earlier case in the
if/else anyway.  If you really want to keep it here for some reason, I
guess you should also handle '\r' ?


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
