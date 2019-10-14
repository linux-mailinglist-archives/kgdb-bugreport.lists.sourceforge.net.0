Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA31D6C3A
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 15 Oct 2019 01:51:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iKA7u-0000SA-Mc
	for lists+kgdb-bugreport@lfdr.de; Mon, 14 Oct 2019 23:51:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iKA7t-0000Rw-Bt
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Oct 2019 23:51:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k4LG9A60e0AWB6+HxDiNUTXT9+nVfxCFWPyoyVSEVA0=; b=Et4U5ZiN8l2MyIfQaYFoiflULo
 Sk7oV/QsyDJO+lGp5kZFtncWTR3NVKpkYePaR9m+g9xaa1gAyZgR4Ah2p8IU6aeJSmJwRaPhY3FvM
 52DyZDcNaLdRKWS8f1QxWuXiZEi5WqpEc1CGFznZkOjSanZ2HyHpXbyaMfA/1ExGG/1U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k4LG9A60e0AWB6+HxDiNUTXT9+nVfxCFWPyoyVSEVA0=; b=HSFOia1vs9URUu5hLVfpwufQ5u
 DQMf6w1zWSQlaOTorYYf2d5y+BnRWVUF8wjeIuTxe54ZzD06KjciJM3k2ZB1Fo2PdBP2R5Tofsw9B
 N/8VHwusWw7l0suoVYVNZGiWXuFKeNoLOppqUKOsTGcpT/JdFip9cXO1KNR1CCmAnTJU=;
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iKA7r-009Db8-I3
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Oct 2019 23:51:45 +0000
Received: by mail-io1-f68.google.com with SMTP id n197so41723249iod.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 14 Oct 2019 16:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k4LG9A60e0AWB6+HxDiNUTXT9+nVfxCFWPyoyVSEVA0=;
 b=IB2aUdkbO4uaayL9lm/pGvtaPMct+pJEOEo+QZUCZ2M5Ui9SlTD0C+j3+Zmd6dHTN4
 qgVmLoHycRpD0utCSuz/9a3EpAUk6f+3ot7NYRegMNOA6YcNltTEJh/Mc0RacU4MOobj
 OtKE1oH/ITR4/GVnSEpkxGKLK0JFYaNpdbAHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k4LG9A60e0AWB6+HxDiNUTXT9+nVfxCFWPyoyVSEVA0=;
 b=GbxCiui04d3eKT9bND81aWyau80rtos9YQHuCOOZhSPquB6JvrJoVSjLFNgeKDwZDH
 GzYKELkeg6KG2K2kSgC587nbOHR0A6tW7FG/AsEeYWysYTAGS3ay4g4ZUGuG4ux3234A
 wOooWyOws5XOKzbvKRcAMR082Q6ab/PMSpei/3DaCe2j/ETvJX/wzjih93hqzzuvCpXc
 0k/kdJDf1SRrXuAU+jiFJfNjVACIPeyJJnnCFdDLIMXFy/iZsue48snvov7Lnwai394S
 bTkP7GMaVCtOH3N3RZFX38XEzzyOYHdMmy644COvCwHpgYYkNxQdU0NoQrgBQjcP2i1o
 bBAQ==
X-Gm-Message-State: APjAAAXag9kEm8S4OI48DPOzcH5PB38mfg2OYYfocsLgJ7PiOjfNMKPj
 cRrGGV2oYusfH+xZIg0rtQRiBk/5eAU=
X-Google-Smtp-Source: APXvYqza0jEx4KcTtNVZ5GAxsVZfgSo+8JjYDVeAyGd0MzaLMVl1auQeeEVtIvPtmjS0b80EQs11BQ==
X-Received: by 2002:a05:6602:1c4:: with SMTP id
 w4mr37123355iot.153.1571097097196; 
 Mon, 14 Oct 2019 16:51:37 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com.
 [209.85.166.43])
 by smtp.gmail.com with ESMTPSA id f23sm15205361ioc.36.2019.10.14.16.51.36
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2019 16:51:37 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id z19so41871973ior.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 14 Oct 2019 16:51:36 -0700 (PDT)
X-Received: by 2002:a92:819c:: with SMTP id q28mr3325441ilk.269.1571097095829; 
 Mon, 14 Oct 2019 16:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <201910110030.gUpQOCmR%lkp@intel.com>
 <20191014162847.kshvdwcahyjbtweo@holly.lan>
In-Reply-To: <20191014162847.kshvdwcahyjbtweo@holly.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Oct 2019 16:51:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WL_2zDoqdB96NK5tLwmqsL4Zt+wUbhKrGq7dz+sUAdYw@mail.gmail.com>
Message-ID: <CAD=FV=WL_2zDoqdB96NK5tLwmqsL4Zt+wUbhKrGq7dz+sUAdYw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.68 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: githubusercontent.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iKA7r-009Db8-I3
Subject: Re: [Kgdb-bugreport] [danielt-linux:kgdb/for-next 4/4]
 kernel/debug/debug_core.c:452:17: warning: array subscript is outside array
 bounds
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
Cc: kgdb-bugreport@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, Oct 14, 2019 at 9:28 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Hi Doug
>
> On Fri, Oct 11, 2019 at 12:41:31AM +0800, kbuild test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/danielt/linux.git kgdb/for-next
> > head:   2277b492582d5525244519f60da6f9daea5ef41a
> > commit: 2277b492582d5525244519f60da6f9daea5ef41a [4/4] kdb: Fix stack crawling on 'running' CPUs that aren't the master
> > config: sh-allyesconfig (attached as .config)
> > compiler: sh4-linux-gcc (GCC) 7.4.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         git checkout 2277b492582d5525244519f60da6f9daea5ef41a
> >         # save the attached .config to linux build tree
> >         GCC_VERSION=7.4.0 make.cross ARCH=sh
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
> >
> > All warnings (new ones prefixed by >>):
> >
> >    kernel/debug/debug_core.c: In function 'kdb_dump_stack_on_cpu':
> > >> kernel/debug/debug_core.c:452:17: warning: array subscript is outside array bounds [-Warray-bounds]
> >      if (!(kgdb_info[cpu].exception_state & DCPU_IS_SLAVE)) {
> >            ~~~~~~~~~^~~~~
> >    kernel/debug/debug_core.c:469:33: warning: array subscript is outside array bounds [-Warray-bounds]
> >      kgdb_info[cpu].exception_state |= DCPU_WANT_BT;
> >    kernel/debug/debug_core.c:470:18: warning: array subscript is outside array bounds [-Warray-bounds]
> >      while (kgdb_info[cpu].exception_state & DCPU_WANT_BT)
> >             ~~~~~~~~~^~~~~
>
> Thoughts on the following?
>
> From 9e0114bc9ae504c3a7e837c977d64f84b2010d8e Mon Sep 17 00:00:00 2001
> From: Daniel Thompson <daniel.thompson@linaro.org>
> Date: Fri, 11 Oct 2019 08:49:29 +0100
> Subject: [PATCH] kdb: Avoid array subscript warnings on non-SMP builds
>
> Recent versions of gcc (reported on gcc-7.4) issue array subscript
> warnings for builds where SMP is not enabled.
>
> There is no bug here but there is scope to improve the code
> generation for non-SMP systems (whilst also silencing the warning).
>
> Reported-by: kbuild test robot <lkp@intel.com>
> Fixes: 2277b492582d ("kdb: Fix stack crawling on 'running' CPUs that aren't the master")
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  kernel/debug/debug_core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 70e86b4b4932..eccb7298a0b5 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -449,7 +449,8 @@ void kdb_dump_stack_on_cpu(int cpu)
>                 return;
>         }
>
> -       if (!(kgdb_info[cpu].exception_state & DCPU_IS_SLAVE)) {
> +       if (!IS_ENABLED(CONFIG_SMP) ||
> +           !(kgdb_info[cpu].exception_state & DCPU_IS_SLAVE)) {

Thanks for sending this!  I saw the alert but I was on vacation last
Friday and today has been a trainwreck.

I guess my first thought is that this fix is slightly confusing to
read.  Reading it makes you think that if we don't have SMP that we'll
print:

  ERROR: Task on cpu %d didn't stop in the debugger

It took me a second to realize that of course this would never print
because if we're ot on SMP then the first "if" test would trip and
we'd return.  Which makes me wonder why we couldn't instead change
that "if" test to:

 if (!IS_ENABLED(CONFIG_SMP) || cpu == raw_smp_processor_id()) {

...and be done with it.

---

As far as the "there is no bug here", I actually wonder.  We are
always called with a cpu that we got from "kdb_process_cpu(p)", right?
 That function sets cpu to 0 if "cpu > num_possible_cpus()".  ...but
shouldn't it be >=?  I guess task_cpu() probably returned something
sane anyway...

I also find it a little odd that kdb_process_cpu() returns a signed
int even though task_cpu() returns an unsigned one, but I guess we
don't need to worry about the case where the number of CPUs can't fit
into a signed int?

---

Hopefully that's all correct.  I'm just about outta time and I wanted
to send something off.  If something looks wrong it probably is...

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
