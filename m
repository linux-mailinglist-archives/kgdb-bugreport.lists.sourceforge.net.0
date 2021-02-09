Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 865AD314DD0
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 Feb 2021 12:07:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l9Qs4-0005ye-72
	for lists+kgdb-bugreport@lfdr.de; Tue, 09 Feb 2021 11:07:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1l9Qs3-0005yP-IM
 for kgdb-bugreport@lists.sourceforge.net; Tue, 09 Feb 2021 11:07:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l5EJybRjlcUj0cKcnS64rOqPsdV5T718ti2rqezNgtA=; b=LGpwC8XrMJe5HwNHthm27MClFP
 QKjTQj0zc9TZII422d6x3pCSUXs2GGhJBD3q7kHzMrP2VZcm5J7UkEBfjCNnRXY2Eo0pGcCZm8Ytn
 hfJY90G+t6Tq6Ec8WIUo+rz6oqAEFjOryVtYc5ffQaN/rlYCHvTGFx5BM0hfFakzOO9o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l5EJybRjlcUj0cKcnS64rOqPsdV5T718ti2rqezNgtA=; b=mAieJoufWDgpmXTk4dh2zK6LXl
 EB3RfJfwJVeGZwVCdeQWpRjYue1QdhXJa+eiHogv8FVTV3JcoLj8VwegvTC1tAs8MFbqnqq+Mpk2Y
 UHwU15dFrZDOXo1Z+ly4arHeXcem5e/D1E8yKy9evYLyOu6JL+Lamsf1BNMNp3fACxYU=;
Received: from mail-lf1-f51.google.com ([209.85.167.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1l9QrW-0006OS-CY
 for kgdb-bugreport@lists.sourceforge.net; Tue, 09 Feb 2021 11:07:33 +0000
Received: by mail-lf1-f51.google.com with SMTP id v5so25479657lft.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 09 Feb 2021 03:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l5EJybRjlcUj0cKcnS64rOqPsdV5T718ti2rqezNgtA=;
 b=u/ku/44GHyiITEMkHko1k4WquzgkS67Nq7Pn4nB9PJ4DPAEi8KD8vihae7WnnVKvcI
 7Dmhv9NgmeHwkTw1hidSSR7J2+LndGjZPYUWGncD0s/ajPERZSYQF5O3dtGyK4DysZ9K
 SZc1E4vufJvvt3exrLO7cR8i/drfxzGPWbgkYLfsTSXqAUEfowwVLRAxKQH3GE5IJetg
 XB6ZNqyx1Zlgkn9gvejccWj0crMW/Ut6jdqwdlQHIPNfWI52WTFbGefR+hKFCsZ+oLOJ
 9grlEexIFK54ZNauc1NaP86Q4eC00qGGutsP/XCzciZFFiTDVRYXXmKtdd1jslC0rjJN
 PRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l5EJybRjlcUj0cKcnS64rOqPsdV5T718ti2rqezNgtA=;
 b=dnDNataU9vZ0TUBUzyGdXoRtoWZDuOcd2sG3JAe/+4ko2uAkW2lTSWNWAhwHI8YNE7
 cQNGwVGHAwE5u5sHW8OT9lrzhSihGdtBdhI4UZaKltDDKdVp27TQpWAisoPpkxuzchFJ
 JDaO0uoFOf4GgzoG+UZ9mTFuE/zgFb16pYpn+Cs0gW0PXRkEKfnuxjEg2isI+kkB4jzO
 fpPA9LXAlm7Ppcy0Y/toL/pDHghYF28Cb2j4N6Ii8DCXLrFA5wET3xrH1tjkOIny7OJ1
 Te/N9adVGTMqIByj3byjZk2x3C2Un8LMCFT+eHPRyapVxdFSBb/tjaDjDySR0WwL0gSl
 w2Cw==
X-Gm-Message-State: AOAM530UH3vXC6yiOspwfR+rBqieCQQY5HFiIrj9dWNVv1SBhw5rzdCu
 D0wDiADWfKc+p2Wa6YhTLPyaUgicX6v9okPBHI3knQ==
X-Google-Smtp-Source: ABdhPJzLbQUT4WCDN4pSG8w6zr/IEQsLh2NzEQBC6nrHaNNP7YMTXvwlagtlTwlztPvOLWQ/TglCFfRjUudGxyV7WKY=
X-Received: by 2002:a19:6410:: with SMTP id y16mr13216081lfb.113.1612868831761; 
 Tue, 09 Feb 2021 03:07:11 -0800 (PST)
MIME-Version: 1.0
References: <1611915427-3196-1-git-send-email-sumit.garg@linaro.org>
 <20210208094303.csu2kkyi25d7a25y@maple.lan>
 <CAFA6WYNDydeDg8J16tFC30=yXCDMeaMKOm0Jt-3yF5jUMCq0yQ@mail.gmail.com>
 <20210208134802.tr7jzk27ja5chwgf@maple.lan>
In-Reply-To: <20210208134802.tr7jzk27ja5chwgf@maple.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 9 Feb 2021 16:37:00 +0530
Message-ID: <CAFA6WYO_ZNt8P_fAiaj17yHu2spWyjYAm78xPGaRxJsggE4z=A@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.51 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.51 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
X-Headers-End: 1l9QrW-0006OS-CY
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: Simplify kdb commands
 registration
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, 8 Feb 2021 at 19:18, Daniel Thompson <daniel.thompson@linaro.org> wrote:
>
> On Mon, Feb 08, 2021 at 03:18:19PM +0530, Sumit Garg wrote:
> > On Mon, 8 Feb 2021 at 15:13, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> > >
> > > On Fri, Jan 29, 2021 at 03:47:07PM +0530, Sumit Garg wrote:
> > > > @@ -1011,25 +1005,17 @@ int kdb_parse(const char *cmdstr)
> > > >               ++argv[0];
> > > >       }
> > > >
> > > > -     for_each_kdbcmd(tp, i) {
> > > > -             if (tp->cmd_name) {
> > > > -                     /*
> > > > -                      * If this command is allowed to be abbreviated,
> > > > -                      * check to see if this is it.
> > > > -                      */
> > > > -
> > > > -                     if (tp->cmd_minlen
> > > > -                      && (strlen(argv[0]) <= tp->cmd_minlen)) {
> > > > -                             if (strncmp(argv[0],
> > > > -                                         tp->cmd_name,
> > > > -                                         tp->cmd_minlen) == 0) {
> > > > -                                     break;
> > > > -                             }
> > > > -                     }
> > > > -
> > > > -                     if (strcmp(argv[0], tp->cmd_name) == 0)
> > > > +     list_for_each_entry(tp, &kdb_cmds_head, list_node) {
> > > > +             /*
> > > > +              * If this command is allowed to be abbreviated,
> > > > +              * check to see if this is it.
> > > > +              */
> > > > +             if (tp->cmd_minlen && (strlen(argv[0]) <= tp->cmd_minlen) &&
> > > > +                 (strncmp(argv[0], tp->cmd_name, tp->cmd_minlen) == 0))
> > > >                               break;
> > >
> > > Looks like you forgot to unindent this line.
> > >
> > > I will fix it up but... checkpatch would have found this.
> > >
> >
> > Ah, I missed to run checkpatch on v3. Thanks for fixing this up.
>
> Unfortunately, it's not just checkpatch. This patch also causes a
> large number of test suite regressions. In particular it looks like
> kgdbwait does not work with this patch applied.
>
> The problem occurs on multiple architectures all with
> close-to-defconfig kernels. However to share one specific
> failure, x86_64_defconfig plus the following is not bootable:
>
>     ../scripts/config --enable DEBUG_INFO --enable DEBUG_FS \
>       --enable KALLSYMS_ALL --enable MAGIC_SYSRQ --enable KGDB \
>       --enable KGDB_TESTS --enable KGDB_KDB --enable KDB_KEYBOARD \
>       --enable LKDTM
>
> Try:
>
>     qemu-system-x86_64 \
>       -enable-kvm -m 1G -smp 2 -nographic
>       -kernel arch/x86/boot/bzImage \
>       -append "console=ttyS0,115200 kgdboc=ttyS0 kgdbwait"
>

Thanks Daniel for this report. I am able to reproduce it with
"kgdbwait" and will investigate it.

-Sumit

>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
