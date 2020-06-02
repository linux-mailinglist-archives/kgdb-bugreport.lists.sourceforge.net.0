Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D67911EBD9A
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  2 Jun 2020 16:03:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jg7VU-0000Zh-MR
	for lists+kgdb-bugreport@lfdr.de; Tue, 02 Jun 2020 14:03:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jg7VT-0000ZY-Qn
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Jun 2020 14:03:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ggOR0Cl510IRTxzlmGLn42zz2g74i90VX9kjLvEOxG4=; b=h5dr57qCAOziUMwQw5Wrnut2KA
 iJBn1QoAyDtYXH2/ShlndreOiHG7ZHM9oQmEemU/KLxwZPtWgMoNoMd1Zh5s8lDWjauXjSYb5oYGY
 d49TWNrlPNqa2jX0s0EYPYXv9UFw4e00wD/cW9VIO0iNz4BGM+86IXWP62iNrqimTOVU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ggOR0Cl510IRTxzlmGLn42zz2g74i90VX9kjLvEOxG4=; b=eFUFxwW459u2u8ty8ScHDqUUWS
 zwviaSdK2ww1dxKBdmS0AKCe0Zkgr0don3ngj9+4uVyIM36OkGi+VjpKP3935LpHpz1tBhlmJpei0
 ZP0famHw+NEMfgNDQ8pRl7m2gyDPSfqyX16YmnWQCDA4b2XQu0Xu+KdXG+3CZgVUhlY4=;
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jg7VP-002iY9-FQ
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Jun 2020 14:03:07 +0000
Received: by mail-ot1-f66.google.com with SMTP id h7so11008537otr.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Jun 2020 07:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ggOR0Cl510IRTxzlmGLn42zz2g74i90VX9kjLvEOxG4=;
 b=SQy7D7fNQ3uB48bFB7C6078JBK3f2uXs9BQtMYI0Gu8eUcIq0o8jucbp0fmtfAR9wx
 XlIYQlW/J2Q+RqepPopExAwHAYiSSyrLZWXO4/By8juZgrE5WNzzHifzgqtv5p8dT0hU
 TsqdzKB7xJpi/e2byOH4RGCZvpC8+aaIuPK7tai5OnfW2r3FDoLvFZ+2HMlBpG7WTfYp
 /SBnza9WHkUW0IMuLqJqWb25LFQ8e7ZlHaA+mXGufx9OXNNhk8jG0dyGxZVZe3tL9QSp
 cDrPeRzozgk8kiS4KhVCKRFobBBHSoMxxr5eI8JvyeV4uC+lMD7+7b2V8A+JXYfkJRXW
 Nzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ggOR0Cl510IRTxzlmGLn42zz2g74i90VX9kjLvEOxG4=;
 b=gXDCMoNeCX/auw1qeuUIstPylaQQ4rhrzagXuZtawbiVQmCulj6AjEt+soRmMnlrSG
 Z6o+ReFNsExEyUo4+Sq8ZycG0jo/1hEsaJejKwufsDnReQlvTyk8yKtHSAkMKFYb0Bby
 GpnZj5ob6jvO2G3ElLwGOHLSzNnip2V3iyr+uYq3XP5CJ6YQhNhDH9CfM3sW7ixgTDCi
 U+eTRNeR86wahhGOrOxAvoT2Scn6WFArNGw8w89JfhrNf4DCVKL2L/64gt9ekNEq2DeN
 f4eg1cGa0l2xplYfwfbbjQaiAnZ12fD4ori5NyuW/JatjGt8Nbe79HIVZv3E+bxnKORJ
 6/Eg==
X-Gm-Message-State: AOAM530imbuWmTkI2yoCP1VP6sIHhhJrZnzcStGoJFSrirweVmsDzEzr
 TpnWXonHVyLhaHu8UEjlFROHRSqWVgqCglP4LrdkMw==
X-Google-Smtp-Source: ABdhPJytCbEQYf19zfmhcnF1C67ZEQmnyKMQzhw8ciOZ3Sp9IJlUwT3j1I6XVDW5aslGKqF0+wcRiwP/2RlvTqRyRTA=
X-Received: by 2002:a9d:7651:: with SMTP id o17mr4779813otl.21.1591106577587; 
 Tue, 02 Jun 2020 07:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <1590751607-29676-1-git-send-email-sumit.garg@linaro.org>
 <1590751607-29676-5-git-send-email-sumit.garg@linaro.org>
 <20200602134650.mdovxoa6cj2hgvei@holly.lan>
In-Reply-To: <20200602134650.mdovxoa6cj2hgvei@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 2 Jun 2020 19:32:46 +0530
Message-ID: <CAFA6WYNSDbh6uuD03oNWDL2a3x2g5XCeYRWg1toZ8DstvJgWYw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.66 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jg7VP-002iY9-FQ
Subject: Re: [Kgdb-bugreport] [PATCH v4 4/4] kdb: Switch to use safer
 dbg_io_ops over console APIs
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
Cc: Petr Mladek <pmladek@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jslaby@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, 2 Jun 2020 at 19:16, Daniel Thompson <daniel.thompson@linaro.org> wrote:
>
> On Fri, May 29, 2020 at 04:56:47PM +0530, Sumit Garg wrote:
> > In kgdb context, calling console handlers aren't safe due to locks used
> > in those handlers which could in turn lead to a deadlock. Although, using
> > oops_in_progress increases the chance to bypass locks in most console
> > handlers but it might not be sufficient enough in case a console uses
> > more locks (VT/TTY is good example).
> >
> > Currently when a driver provides both polling I/O and a console then kdb
> > will output using the console. We can increase robustness by using the
> > currently active polling I/O driver (which should be lockless) instead
> > of the corresponding console. For several common cases (e.g. an
> > embedded system with a single serial port that is used both for console
> > output and debugger I/O) this will result in no console handler being
> > used.
> >
> > In order to achieve this we need to reverse the order of preference to
> > use dbg_io_ops (uses polling I/O mode) over console APIs. So we just
> > store "struct console" that represents debugger I/O in dbg_io_ops and
> > while emitting kdb messages, skip console that matches dbg_io_ops
> > console in order to avoid duplicate messages. After this change,
> > "is_console" param becomes redundant and hence removed.
> >
> > Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>
> Looking good, only one minor comment left on my side (including the
> three patches prior).
>
> > diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> > index 9e5a40d..5e00bc8 100644
> > --- a/kernel/debug/kdb/kdb_io.c
> > +++ b/kernel/debug/kdb/kdb_io.c
> > @@ -560,12 +560,14 @@ static void kdb_msg_write(char *msg, int msg_len)
> >       if (msg_len == 0)
> >               return;
> >
> > -     if (dbg_io_ops && !dbg_io_ops->is_console)
> > +     if (dbg_io_ops)
> >               kdb_io_write(msg, msg_len);
>
> Since this now slots on so cleanly and there are not multiple calls
> to kdb_io_write() then I think perhaps factoring this out into its
> own function (in patch 1) is no long necessary. The character write
> loop can go directly into this function.
>

Okay, will update it in the next version.

-Sumit

>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
