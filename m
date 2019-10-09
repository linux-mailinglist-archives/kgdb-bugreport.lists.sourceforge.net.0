Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA225D0B33
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Oct 2019 11:31:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iI8JE-00045f-Oo
	for lists+kgdb-bugreport@lfdr.de; Wed, 09 Oct 2019 09:31:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iI8JD-00045Q-6F
 for kgdb-bugreport@lists.sourceforge.net; Wed, 09 Oct 2019 09:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=txRsFexRpU1aPNeD8b7JBsX8kLmbN3JP80S/708Wgfo=; b=auYtK6EKyAR5RB5TPaMl9QanLp
 hCgnFpCo40HRgQdYQABY43lLZ61aUsl16bOdkey3nun9yACZTXSeRH75aNcDGa7rh53BmE6is2IlA
 CQlBb7RiJGm59GHxPVRSxJ6qFdYYQIR6x+QFX1kMreTHc3TVyrGjAy5qOIWdA4MFeN74=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=txRsFexRpU1aPNeD8b7JBsX8kLmbN3JP80S/708Wgfo=; b=WFdMuogxTmrdpQKDfcxhdcEApD
 q76bKYOwAu1Fypjt5tc5k69FlFo+bGXxDHaoRwTeohw0ykrCJqVn6e3scWj/RB2EwA9/oR2xX5EEj
 AL9r7pnAUYE242OR7hxv8WOmrORMHD03KnY980iGrXcsePWzwzEkWKi0zlGyqNABynkY=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iI8J8-003kMn-Rs
 for kgdb-bugreport@lists.sourceforge.net; Wed, 09 Oct 2019 09:31:03 +0000
Received: by mail-wm1-f67.google.com with SMTP id 7so1663608wme.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 09 Oct 2019 02:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=txRsFexRpU1aPNeD8b7JBsX8kLmbN3JP80S/708Wgfo=;
 b=gLPsWmnczY0e7Wk71kiVoTCc+JY1/qPjMfZhqFjWWiHNLfnMrxfDVJ4ghpJXBnF/YO
 Ec7ocU5Li+FBvSx1Pzm6980RCiIuAvnrfezKS2Cye/spAHE3FLgVDDh5q+wych4laJK5
 12J0snnlMlN91oG5srZHsewi2HyMuLhJis4D5IpqC14ataRJR2udYgRWMCot19L8qS5N
 rlFxn5e8XqicCVlrcdR1QmC9YsLMjzIt7V922QQgaQd63vTb3esyyfWSzf/DfuZPD2MZ
 Ze8bt4iNG7rFJYsuWatafeTzxheh6f+VetzqNV8Nz1Yu1iMYMs9UayvzpS8evlLdg/JX
 rV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=txRsFexRpU1aPNeD8b7JBsX8kLmbN3JP80S/708Wgfo=;
 b=rt1Zv0StbQQKlwmbbRJdj0Z9A88F4rBUWrikz0Wb16jd4IXBXQf6APjeJZqsolKZze
 xsB9sPM1DoVvD7QwU7/KDqJw/qmqLcEEYRu7tmXmvDbmJJZpgQH9rwr0CvkDGVUTkHa/
 BVOmtXw2e9+KXy6DDKW+PmhbWJTS85yGOof0q9vuWdwNGAAs5vsmNMtMlnRNlwSuP4hA
 zL7YHASamgcMnqLjj14m8MDXAnUBUkr6clOM/Vw7glevDcZRZjjMEQfkI17MPtMA+Lvg
 f8ZEAHWBTTu5vPy8zEekUAYjPuzCx79gOFLSCSxyO0WtxMNI8uAAJc9tsw6UHBotKW0c
 oQUw==
X-Gm-Message-State: APjAAAXbcU3cP0k8C8Yx4VQu+J8opz5QsthF+GMkNgx5oc8oGJOW58X6
 2yOgt5HYUE6/x5klNtc5hYks8w==
X-Google-Smtp-Source: APXvYqxEtDqy10+w0EezfdD5gJ8QG5/xCzlEo6BQTWYPwPc7Byjv7IsGWZz72CanmYJ3aEur7mF7Nw==
X-Received: by 2002:a1c:ed0d:: with SMTP id l13mr1863770wmh.76.1570613451951; 
 Wed, 09 Oct 2019 02:30:51 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id b186sm2330471wmd.16.2019.10.09.02.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 02:30:51 -0700 (PDT)
Date: Wed, 9 Oct 2019 10:30:49 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20191009093049.tnz442bo54bzmzmz@holly.lan>
References: <20191008132043.7966-1-daniel.thompson@linaro.org>
 <20191008132043.7966-4-daniel.thompson@linaro.org>
 <CAD=FV=W9Tdh2hPekzgSYnCqoTX_ms1GY-FXgnxd-uEW0SWbyuw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=W9Tdh2hPekzgSYnCqoTX_ms1GY-FXgnxd-uEW0SWbyuw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.67 listed in list.dnswl.org]
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iI8J8-003kMn-Rs
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

On Tue, Oct 08, 2019 at 03:21:02PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Oct 8, 2019 at 6:21 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > kdb_read() contains special case logic to force it exit after reading
> > a single character. We can remove all the special case logic by directly
> > calling the function to read a single character instead. This also
> > allows us to tidy up the function prototype which, because it now matches
> > getchar(), we can also rename in order to make its role clearer.
> 
> nit: since you're doing the rename, should you rename
> kdb_read_handle_escape() to match?

Will do.


> > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > ---
> >  kernel/debug/kdb/kdb_io.c | 56 ++++++++++++++++-----------------------
> >  1 file changed, 23 insertions(+), 33 deletions(-)
> >
> > diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> > index 78cb6e339408..a9e73bc9d1c3 100644
> > --- a/kernel/debug/kdb/kdb_io.c
> > +++ b/kernel/debug/kdb/kdb_io.c
> > @@ -106,7 +106,19 @@ static int kdb_read_handle_escape(char *buf, size_t sz)
> >         return -1;
> >  }
> >
> > -static int kdb_read_get_key(char *buffer, size_t bufsize)
> > +/*
> > + * kdb_getchar
> > + *
> > + * Read a single character from kdb console (or consoles).
> 
> nit: should we start moving to the standard kernel convention of
> kernel-doc style comments?  See
> "Documentation/doc-guide/kernel-doc.rst"

It will look a little odd whilst the others are still in the old form
but it seems like a good direction of travel... will update.

> > + *
> > + * An escape key could be the start of a vt100 control sequence such as \e[D
> > + * (left arrow) or it could be a character in its own right.  The standard
> > + * method for detecting the difference is to wait for 2 seconds to see if there
> > + * are any other characters.  kdb is complicated by the lack of a timer service
> > + * (interrupts are off), by multiple input sources. Escape sequence processing
> > + * has to be done as states in the polling loop.
> 
> Before your paragraph, maybe add: "Most of the work of this function
> is dealing with escape sequences." to give it a little bit of context.
> 
> 
> > + */
> > +static int kdb_getchar(void)
> 
> Is "int" the right return type here, or "unsigned char"?  You never
> return EOF, right?  Always a valid character?  NOTE: if you do change
> this to "unsigned char" I think you still need to keep the local "key"
> variable as an "int" since -1 shouldn't be confused with the character
> 255.

unsigned char sounds best.


> >  {
> >  #define ESCAPE_UDELAY 1000
> >  #define ESCAPE_DELAY (2*1000000/ESCAPE_UDELAY) /* 2 seconds worth of udelays */
> > @@ -124,7 +136,6 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
> >                 }
> >
> >                 key = (*f)();
> > -
> >                 if (key == -1) {
> >                         if (escape_delay) {
> >                                 udelay(ESCAPE_UDELAY);
> > @@ -134,14 +145,6 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
> >                         continue;
> >                 }
> >
> > -               if (bufsize <= 2) {
> > -                       if (key == '\r')
> > -                               key = '\n';
> > -                       *buffer++ = key;
> > -                       *buffer = '\0';
> > -                       return -1;
> > -               }
> > -
> >                 if (escape_delay == 0 && key == '\e') {
> >                         escape_delay = ESCAPE_DELAY;
> >                         ped = escape_data;
> > @@ -183,17 +186,7 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
> >   *     function.  It is not reentrant - it relies on the fact
> >   *     that while kdb is running on only one "master debug" cpu.
> >   * Remarks:
> > - *
> > - * The buffer size must be >= 2.  A buffer size of 2 means that the caller only
> > - * wants a single key.
> 
> By removing this you broke "BTAPROMPT".  So doing:
> 
> set BTAPROMPT=1
> bta
> 
> It's now impossible to quit out.  Not that I've ever used BTAPROMPT,
> but seems like we should either get rid of it or keep it working.

Thanks. Just to check I got exactly what you meant I assume this could
also have been phrased as "it looks like you forgot to convert the
kdb_getstr() in kdb_bt1() over to use the new kdb_getchar() function"?

PS I will update kgdbtest to cover this case.


> > - *
> > - * An escape key could be the start of a vt100 control sequence such as \e[D
> > - * (left arrow) or it could be a character in its own right.  The standard
> > - * method for detecting the difference is to wait for 2 seconds to see if there
> > - * are any other characters.  kdb is complicated by the lack of a timer service
> > - * (interrupts are off), by multiple input sources and by the need to sometimes
> > - * return after just one key.  Escape sequence processing has to be done as
> > - * states in the polling loop.
> > + *     The buffer size must be >= 2.
> >   */
> >
> >  static char *kdb_read(char *buffer, size_t bufsize)
> > @@ -228,9 +221,7 @@ static char *kdb_read(char *buffer, size_t bufsize)
> >         *cp = '\0';
> >         kdb_printf("%s", buffer);
> >  poll_again:
> > -       key = kdb_read_get_key(buffer, bufsize);
> > -       if (key == -1)
> > -               return buffer;
> > +       key = kdb_getchar();
> >         if (key != 9)
> >                 tab = 0;
> >         switch (key) {
> > @@ -741,7 +732,7 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
> >
> >         /* check for having reached the LINES number of printed lines */
> >         if (kdb_nextline >= linecount) {
> > -               char buf1[16] = "";
> > +               char ch;
> 
> The type of "ch" should be the same as returned by kdb_getchar()?
> Either "int" if you're keeping it "int" or "unsigned char"?

Probably... although the assumption that kdb strings are char * is burnt
in a lot of places so there will still be further tidy up needed.


> >                 /* Watch out for recursion here.  Any routine that calls
> >                  * kdb_printf will come back through here.  And kdb_read
> > @@ -776,39 +767,38 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
> >                 if (logging)
> >                         printk("%s", moreprompt);
> >
> > -               kdb_read(buf1, 2); /* '2' indicates to return
> > -                                   * immediately after getting one key. */
> > +               ch = kdb_getchar();
> >                 kdb_nextline = 1;       /* Really set output line 1 */
> >
> >                 /* empty and reset the buffer: */
> >                 kdb_buffer[0] = '\0';
> >                 next_avail = kdb_buffer;
> >                 size_avail = sizeof(kdb_buffer);
> > -               if ((buf1[0] == 'q') || (buf1[0] == 'Q')) {
> > +               if ((ch == 'q') || (ch == 'Q')) {
> >                         /* user hit q or Q */
> >                         KDB_FLAG_SET(CMD_INTERRUPT); /* command interrupted */
> >                         KDB_STATE_CLEAR(PAGER);
> >                         /* end of command output; back to normal mode */
> >                         kdb_grepping_flag = 0;
> >                         kdb_printf("\n");
> > -               } else if (buf1[0] == ' ') {
> > +               } else if (ch == ' ') {
> >                         kdb_printf("\r");
> >                         suspend_grep = 1; /* for this recursion */
> > -               } else if (buf1[0] == '\n') {
> > +               } else if (ch == '\n' || ch == '\r') {
> >                         kdb_nextline = linecount - 1;
> >                         kdb_printf("\r");
> >                         suspend_grep = 1; /* for this recursion */
> > -               } else if (buf1[0] == '/' && !kdb_grepping_flag) {
> > +               } else if (ch == '/' && !kdb_grepping_flag) {
> >                         kdb_printf("\r");
> >                         kdb_getstr(kdb_grep_string, KDB_GREP_STRLEN,
> >                                    kdbgetenv("SEARCHPROMPT") ?: "search> ");
> >                         *strchrnul(kdb_grep_string, '\n') = '\0';
> >                         kdb_grepping_flag += KDB_GREPPING_FLAG_SEARCH;
> >                         suspend_grep = 1; /* for this recursion */
> > -               } else if (buf1[0] && buf1[0] != '\n') {
> > +               } else if (ch && ch != '\n') {
> 
> Remove "&& ch != '\n'".  We would have hit an earlier case in the
> if/else anyway.  If you really want to keep it here for some reason, I
> guess you should also handle '\r' ?

Let's remove.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
