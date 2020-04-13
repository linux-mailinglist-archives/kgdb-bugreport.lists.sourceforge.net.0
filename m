Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 171151A6ED1
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 14 Apr 2020 00:00:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jO77x-0001el-SF
	for lists+kgdb-bugreport@lfdr.de; Mon, 13 Apr 2020 22:00:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jO77u-0001eY-O0
 for kgdb-bugreport@lists.sourceforge.net; Mon, 13 Apr 2020 22:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MVAxxHzDK/qARg7NchMjhRdvGGEcCTTmLqMEP50fxqk=; b=Ke60mc1vNKbNzGOCTicSFMvgVX
 xMDMmV1P8e/oMYqlvrtGCmPyBjhw1UkfDyd9dtqPki62p7bp8UUVbfhlUstq446yd6c4qHLqAlJJr
 ZVzRCflcYIzKYI9PdCQc850BbCqh7UA57Prhxf1O0MOnT46Ecr/6UZoVZFagHqJSuq5E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MVAxxHzDK/qARg7NchMjhRdvGGEcCTTmLqMEP50fxqk=; b=L+2MSQ0osCXnFCFAVvY2U7kEpk
 5Ir2Kyn+HFgrVJr4fR56NgIwxIV8k4I39N8TvtabalpKlRwCBSeKKJOzgzK1rE2GIrqU1b0rfN7oh
 dPWnUuhRSkdOJHD0p1U3jW2/Cj2dgCh9IfoIYDABVi4w5+5ePdQtbKr9esVPFgKyiBeA=;
Received: from mail-vs1-f67.google.com ([209.85.217.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jO77r-0005hs-B5
 for kgdb-bugreport@lists.sourceforge.net; Mon, 13 Apr 2020 22:00:22 +0000
Received: by mail-vs1-f67.google.com with SMTP id j65so6409726vsd.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 13 Apr 2020 15:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MVAxxHzDK/qARg7NchMjhRdvGGEcCTTmLqMEP50fxqk=;
 b=oYZb4MqSZ8X2CE6Y/k0aOzKLtL53RMFv1ShrKS9kAZLiSxbTQ/wZMM0ryIYVQLFhhT
 e+ZSddaE+zEhC3DF1QKsjRDUtNgJGnhRe9rM4lDBtjD6CloNjrA2WJk1gHzfbJum7MKL
 lKs4zbUC+eR3iJV6Uc1ONNr9Jby+bhRhWhjIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MVAxxHzDK/qARg7NchMjhRdvGGEcCTTmLqMEP50fxqk=;
 b=KuyF3XA/rLGMR6z/CCCOyLba+sYWS7j06TCj8qsxKSQ0hrC/wAWdKJ5kFOHOl7K3/n
 9WSE1HcBQ9ghr5nkMBF02MrT9t6BPAknDUxLOLNceqv8Db3//OHPqXFl55rk7vR5IVbl
 ihpZcIj2vl2LOlDiu2H9qxzhEEXBUV9cfUtcwsMMhGiaXKZliG2Dl6YQCy50luohhdAz
 k0bEWJEHsvFe5wbtKxVY761p3+bdBr11TBzov+1vhe3Sz40VX7xltc3M2Bxjbk2Ueotr
 pr5TYGv4rZwN1UidEvbMbz8lYtma/7fkeEZq+mN5uh8kaiMP5mrN8ld28kfCZkKeThQl
 1vvw==
X-Gm-Message-State: AGi0PuZQt8xuGGwrXV0pcXy0WK6QpCl2FAkYR1fFb1isXQzYFnY3i3uC
 nP8xo4cvsLhSSZ4phHJZ/sTjv+X/nOE=
X-Google-Smtp-Source: APiQypLLEAnh617Dgrh4FuNHPoEwxAeXWQZfN+4COSBz8iAcGdgsvWeTM8XkZ3/yfUlP0p8aWmG38A==
X-Received: by 2002:a05:6102:48d:: with SMTP id
 n13mr8643183vsa.160.1586815213006; 
 Mon, 13 Apr 2020 15:00:13 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41])
 by smtp.gmail.com with ESMTPSA id j21sm3563792vkj.56.2020.04.13.15.00.11
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2020 15:00:11 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id 43so1959842uak.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 13 Apr 2020 15:00:11 -0700 (PDT)
X-Received: by 2002:a9f:27ca:: with SMTP id b68mr10592105uab.8.1586815210988; 
 Mon, 13 Apr 2020 15:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200410151632.4.I8fba5961bf452ab92350654aa61957f23ecf0100@changeid>
 <202004110744.nPoRwmTD%lkp@intel.com>
In-Reply-To: <202004110744.nPoRwmTD%lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Apr 2020 14:59:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UC-dKgmamNKFn_SEqcEisW1p4Z9iy8Nn8UqUxRsskZ3A@mail.gmail.com>
Message-ID: <CAD=FV=UC-dKgmamNKFn_SEqcEisW1p4Z9iy8Nn8UqUxRsskZ3A@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>,
 Jason Wessel <jason.wessel@windriver.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.67 listed in list.dnswl.org]
 -0.8 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jO77r-0005hs-B5
Subject: Re: [Kgdb-bugreport] [PATCH 4/7] kgdboc: Add earlycon_kgdboc to
 support early kgdb using boot consoles
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
Cc: kbuild-all@lists.01.org, kbuild test robot <lkp@intel.com>,
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 kgdb-bugreport@lists.sourceforge.net, Jiri Slaby <jslaby@suse.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Ingo Molnar <mingo@redhat.com>,
 bp@alien8.de, linux-serial@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Fri, Apr 10, 2020 at 4:56 PM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Douglas,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on arm64/for-next/core]
> [also build test ERROR on tty/tty-testing v5.6 next-20200410]
> [cannot apply to kgdb/kgdb-next]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Douglas-Anderson/kgdb-Support-late-serial-drivers-enable-early-debug-w-boot-consoles/20200411-062123
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
> config: microblaze-mmu_defconfig (attached as .config)
> compiler: microblaze-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=9.3.0 make.cross ARCH=microblaze
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/misc/kgdbts.c: In function 'configure_kgdbts':
> >> drivers/misc/kgdbts.c:1080:8: error: too few arguments to function 'kgdb_register_io_module'
>     1080 |  err = kgdb_register_io_module(&kgdbts_io_ops);

Sigh, I knew I'd forget something stupid.  I have a fix for this and
have confirmed that "kgdbts" continues to work after I fix it.
Running it also found splats similar to what I fixed for "kgdboc" in
commit 81eaadcae81b ("kgdboc: disable the console lock when in kgdb").
I'll att a commit to my next version to move that fix into the kgdb
core and then remove it from "kgdboc".

I'm not setup to use kgdb over EHCI so I'll just fix that so it
compiles and trust that it continues to work.

For now I'll hold up on sending a new version to await feedback on v1.
If I don't hear anything after a little while I'll send a v2 with just
these fixes.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
