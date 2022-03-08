Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E03A14D2421
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  8 Mar 2022 23:18:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nRiA4-0006ad-Kx
	for lists+kgdb-bugreport@lfdr.de; Tue, 08 Mar 2022 22:18:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dianders@chromium.org>) id 1nRi9x-0006aS-HN
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Mar 2022 22:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q667ThhdkxL8AUOuU2qYFbGa17GC7zYlSfkMfKxv3/4=; b=GgjgX2O2biOFt/2esFqfskTzZd
 3fl/1tUfg0Sn5nYxPA8JhHXVoJP4OuRyzL8lKSJ0H3zyT2DE5t7HG79cASFx5DCICYDelbtq9WImC
 tYx2x9MlGRkwYiE+1qLDdipUtxblhRFb1Ml8PUdkgLVG4teQGxAuPCyRfo/D01p1xLc0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q667ThhdkxL8AUOuU2qYFbGa17GC7zYlSfkMfKxv3/4=; b=AYZZ2eIpQuf9QX12SqymMt8wnY
 XCghJsh5Sc+yvyPZD8lJwWVXYNpKouuMN/VsZ6+m5mk1AYIQVtx9nCfG5wM3EnBDlguMHEAOKj3tX
 84slZREVxfLshk8ewNwl0JgJ3E4GV/aNQe/quMtEZ4IKoohAaZfcUmgMgyYaWdt63xE0=;
Received: from mail-wr1-f51.google.com ([209.85.221.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nRi9v-0093pt-DN
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Mar 2022 22:18:23 +0000
Received: by mail-wr1-f51.google.com with SMTP id q14so273759wrc.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Mar 2022 14:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q667ThhdkxL8AUOuU2qYFbGa17GC7zYlSfkMfKxv3/4=;
 b=NusUdDknL66lGLdEP5FNX3LOWWrWLPuP37qgc1opFNmna8r1+mPTnGkGut+szDcFa/
 g2D3r9SMSZRg66H5SIzcejOYlji2wOURANJzlFKjsk/PS2e7FWmhTkUb8u8CDBkM67p8
 4ySDCD9CGHFSObrQ6khjnN5ALk0dIGbg/2xbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q667ThhdkxL8AUOuU2qYFbGa17GC7zYlSfkMfKxv3/4=;
 b=xgXtqIkkjcf9tKmke7GvtCAEsKiueCYQjT9crE5P6uKEdOfwdFBaPeXf1neZb0M0PG
 /eLuWqK+ynACFl02wgQWJd1rsKxfjdJUMAU3YgkhVHw/QAUPF34MgIvqwBUIFR76Y2hz
 P00VHkCgSgFDTxeCKwTr4xtfZOAP/eElr+s+yX6LeDf/uZGDEOE85bFX6LsfsDiCsoQ/
 hKDVS6POE4WLSaaewScoyUtfcw/T3MqMiZwmONCl8M7YQqj8fyex3qJHLE8pYOAYDi1z
 t4O+alhIIhPYgTvxoNJX6whd0ZIaQ/6ynD0YZwfjRCVrfR34vfww1ppz+FMWC1Wmefr3
 6SsA==
X-Gm-Message-State: AOAM530g+npRNtHo3C8sJ7CFrjL6favGqxeAz1szdvCX90k+EW9NyphQ
 +JrnFZDBaLt/F4mESKNdDSKoKZzLWbyC47I6
X-Google-Smtp-Source: ABdhPJxHfo6kz5bemSSufbPmMCd1wpqgsytKOk4A6ECI6I37r1PDOX3pvMwkkf6FV1P4uk3cGGF0zA==
X-Received: by 2002:a17:907:c10:b0:6db:63b1:cd17 with SMTP id
 ga16-20020a1709070c1000b006db63b1cd17mr1115871ejc.730.1646777568670; 
 Tue, 08 Mar 2022 14:12:48 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45]) by smtp.gmail.com with ESMTPSA id
 w22-20020a05640234d600b004165de83109sm31563edc.48.2022.03.08.14.12.47
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 14:12:48 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id u1so212235wrg.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Mar 2022 14:12:47 -0800 (PST)
X-Received: by 2002:adf:eb45:0:b0:1ef:6070:7641 with SMTP id
 u5-20020adfeb45000000b001ef60707641mr14280334wrn.301.1646777567076; Tue, 08
 Mar 2022 14:12:47 -0800 (PST)
MIME-Version: 1.0
References: <20220308033241.22099-1-rdunlap@infradead.org>
 <CAD=FV=W90Hd-baPzurraEaDUGNOCxb8FLUysHKOQg2frMuZRAQ@mail.gmail.com>
 <2c693cb8-f4b8-a723-c804-9492d9cc4881@infradead.org>
In-Reply-To: <2c693cb8-f4b8-a723-c804-9492d9cc4881@infradead.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 8 Mar 2022 14:12:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X004_55zOovjazkqqZ_EXQ-QCYS1o4VxdCvEjt3+7Tbw@mail.gmail.com>
Message-ID: <CAD=FV=X004_55zOovjazkqqZ_EXQ-QCYS1o4VxdCvEjt3+7Tbw@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Tue, Mar 8,
 2022 at 1:19 PM Randy Dunlap <rdunlap@infradead.org>
 wrote: > > Hi Doug,
 > > >> Unknown kernel command line parameters "BOOT_IMAGE=/boot/bzImage-517rc7
 > >> kgdboc=kbd kgdbts=", will be [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.51 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.51 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nRi9v-0093pt-DN
Subject: Re: [Kgdb-bugreport] [PATCH] kgdboc: fix return value of __setup
 handler
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 Igor Zhbanov <i.zhbanov@omprussia.ru>, linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laura Abbott <labbott@redhat.com>, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, Mar 8, 2022 at 1:19 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi Doug,
>
> >> Unknown kernel command line parameters "BOOT_IMAGE=/boot/bzImage-517rc7
> >>   kgdboc=kbd kgdbts=", will be passed to user space.
> >>
> >>  Run /sbin/init as init process
> >>    with arguments:
> >>      /sbin/init
> >>    with environment:
> >>      HOME=/
> >>      TERM=linux
> >>      BOOT_IMAGE=/boot/bzImage-517rc7
> >>      kgdboc=kbd
> >>      kgdbts=
> >>
> >> Fixes: 1cd25cbb2fed ("kgdboc: Fix warning with module build")
> >
> > Are you certain about this "Fixes" line? That commit was just code
> > motion to move the code inside the #ifdef. It sure looks like it was
> > broken even before this.
> >
>
> Yes, but I am not enough of a git user to be able to backtrack
> to see where this code was added. :(
> (help?)

I always just chain back w/ git blame. In this case:

git blame 1cd25cbb2fed~ -- drivers/tty/serial/kgdboc.c

...then search for __setup there and it finds:

Fixes: f2d937f3bf00 ("consoles: polling support, kgdboc")


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
