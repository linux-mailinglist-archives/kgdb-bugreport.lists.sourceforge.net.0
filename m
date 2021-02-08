Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFC93133A1
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  8 Feb 2021 14:48:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l96tv-0005jk-A9
	for lists+kgdb-bugreport@lfdr.de; Mon, 08 Feb 2021 13:48:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1l96tt-0005jD-EV
 for kgdb-bugreport@lists.sourceforge.net; Mon, 08 Feb 2021 13:48:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mNx2OEZE2HU1b2QNLXpDC6fHMy9szkj5oGpfBazya28=; b=lquGAScIWHxjRKomhltUDbYS2h
 S+7Ojf1SaLZNpEoT/OcDxUvYjmeTkBKe5bHI+JgoAzVe8f8ZZ7zq8nEHz/1YyWBrMtE7CXIS1LZlV
 rjqV0lveFW+flP679pRFhCxeNBrC0lpxUPAmQO+f4PxcDSnet3ij5bYueoxcyAkL7iy4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mNx2OEZE2HU1b2QNLXpDC6fHMy9szkj5oGpfBazya28=; b=Y0uIaD4MpnOtHh1o1AhIml8cER
 jZxedDCbYtZqToL6ZRc3ctT+gWiKQIjco0zd4WuL7A5Sea17iQN9cqb3ngvdQONtTzlcFGFzZvZQ8
 NS8j7hZ5p6URT+XKeQZ1BE+Q0b8W2VIfO7Q1E9vgtTW/C4qWlYa4yJwAf7OXK88sQZps=;
Received: from mail-wr1-f44.google.com ([209.85.221.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l96tf-00FZvy-JJ
 for kgdb-bugreport@lists.sourceforge.net; Mon, 08 Feb 2021 13:48:25 +0000
Received: by mail-wr1-f44.google.com with SMTP id b3so17194886wrj.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 08 Feb 2021 05:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mNx2OEZE2HU1b2QNLXpDC6fHMy9szkj5oGpfBazya28=;
 b=jUZjYQLlGqEm/bYXsALBbQclRDXFKxfwG5naGKTWn9ga+IfwzfKmdgFtb4TGavVWmK
 48xYlVDZlPDni5Lr2lzKCPYbXzeYrfkEBbQyKT5wWPuJnzMLApUm7eOku7/bssyPVPSi
 FDX823R1BgOxgLi3AFloSDAUqC1Y5IwDMBsz/Vohp7ZYBYKooLVG8/RSzfXK3Xh383j4
 GURN9b+VdfZEPdwohmiwdJl/6BEvFUEVJpiL3Gt126oZQB3468+34J2Z+khzgiJFFeNX
 a3gWy33lNaj+cI4soLR7Jqhnp45XQyOxAaIyKr5WxwEVQarIzpuJ/ZEJG4jpWMrufo9A
 E+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mNx2OEZE2HU1b2QNLXpDC6fHMy9szkj5oGpfBazya28=;
 b=I5cjHKJCUftj4RXxKc2Yd1xcT+y07hP8t40DjwmzzWwwEDTbhIYLEVxuYF0dQRtRMI
 YfIQzFKy/pYY9HtI5q6WAkH8byMJp4cFmiybObsBTG+ezGtp7gM0xtq2FLVnL/w2bjSj
 2R+m9ycFOB10rk367bKBPfq3oNKECPsmDd7TaDkQlkQlatIo+C4btDEsD8Ga9cu9uTZw
 kk6SFzuJaaf7h6oAoMu14rrnUcfKPknnexB7TQ00vpmwtVT8Tb/T5M/j5NzR7z2f/u3C
 /8+KqcVbaBdM468JweqDw4GubVC33Mxhi5PywI4UyF2MmMNkP2/2HniZbYaJ4HuwNQlN
 u41g==
X-Gm-Message-State: AOAM532QgLNofD/HsFwvb6jDGjwvQpNJRFe8Rbiqo4lMDwG4xUg2c/vN
 GiiA8DSN1hD5NwhYZHF+j2Rh+Q==
X-Google-Smtp-Source: ABdhPJwjmYhDuinB41hfbemCWcHuv3lwIsEtVvyheB2CfxeRuXT7iCvNhiwKpjvla44qT8FeULxctg==
X-Received: by 2002:adf:80c8:: with SMTP id 66mr20269509wrl.344.1612792085140; 
 Mon, 08 Feb 2021 05:48:05 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id h14sm19122828wmq.39.2021.02.08.05.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:48:04 -0800 (PST)
Date: Mon, 8 Feb 2021 13:48:02 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20210208134802.tr7jzk27ja5chwgf@maple.lan>
References: <1611915427-3196-1-git-send-email-sumit.garg@linaro.org>
 <20210208094303.csu2kkyi25d7a25y@maple.lan>
 <CAFA6WYNDydeDg8J16tFC30=yXCDMeaMKOm0Jt-3yF5jUMCq0yQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYNDydeDg8J16tFC30=yXCDMeaMKOm0Jt-3yF5jUMCq0yQ@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.44 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.44 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l96tf-00FZvy-JJ
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

On Mon, Feb 08, 2021 at 03:18:19PM +0530, Sumit Garg wrote:
> On Mon, 8 Feb 2021 at 15:13, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> >
> > On Fri, Jan 29, 2021 at 03:47:07PM +0530, Sumit Garg wrote:
> > > @@ -1011,25 +1005,17 @@ int kdb_parse(const char *cmdstr)
> > >               ++argv[0];
> > >       }
> > >
> > > -     for_each_kdbcmd(tp, i) {
> > > -             if (tp->cmd_name) {
> > > -                     /*
> > > -                      * If this command is allowed to be abbreviated,
> > > -                      * check to see if this is it.
> > > -                      */
> > > -
> > > -                     if (tp->cmd_minlen
> > > -                      && (strlen(argv[0]) <= tp->cmd_minlen)) {
> > > -                             if (strncmp(argv[0],
> > > -                                         tp->cmd_name,
> > > -                                         tp->cmd_minlen) == 0) {
> > > -                                     break;
> > > -                             }
> > > -                     }
> > > -
> > > -                     if (strcmp(argv[0], tp->cmd_name) == 0)
> > > +     list_for_each_entry(tp, &kdb_cmds_head, list_node) {
> > > +             /*
> > > +              * If this command is allowed to be abbreviated,
> > > +              * check to see if this is it.
> > > +              */
> > > +             if (tp->cmd_minlen && (strlen(argv[0]) <= tp->cmd_minlen) &&
> > > +                 (strncmp(argv[0], tp->cmd_name, tp->cmd_minlen) == 0))
> > >                               break;
> >
> > Looks like you forgot to unindent this line.
> >
> > I will fix it up but... checkpatch would have found this.
> >
> 
> Ah, I missed to run checkpatch on v3. Thanks for fixing this up.

Unfortunately, it's not just checkpatch. This patch also causes a
large number of test suite regressions. In particular it looks like
kgdbwait does not work with this patch applied.

The problem occurs on multiple architectures all with
close-to-defconfig kernels. However to share one specific
failure, x86_64_defconfig plus the following is not bootable:

    ../scripts/config --enable DEBUG_INFO --enable DEBUG_FS \
      --enable KALLSYMS_ALL --enable MAGIC_SYSRQ --enable KGDB \
      --enable KGDB_TESTS --enable KGDB_KDB --enable KDB_KEYBOARD \
      --enable LKDTM

Try:

    qemu-system-x86_64 \
      -enable-kvm -m 1G -smp 2 -nographic
      -kernel arch/x86/boot/bzImage \
      -append "console=ttyS0,115200 kgdboc=ttyS0 kgdbwait"


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
