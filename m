Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8D82236B2
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 17 Jul 2020 10:13:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jwLUn-0003bD-Nr
	for lists+kgdb-bugreport@lfdr.de; Fri, 17 Jul 2020 08:13:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mhiramat@kernel.org>) id 1jwLUm-0003b4-4c
 for kgdb-bugreport@lists.sourceforge.net; Fri, 17 Jul 2020 08:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DTrFsylv9zMYywwlkRW+TGwjHWm+AJSNhYuHUrlsu6w=; b=fgg0U97tCxOiM9NkkI1udPAO3P
 4J8KSQz8FtHbmj2ULBXq7Z7EG+teWRgK6RsJmLTahDx0iWSwAe6xygZE/4LbGW1fqxbNYouq/lY0Z
 CKP1GrxxpC7/3gPiBpUNVwMcDlo6cHHTHhIIpSE3NnqwGf3xkR4fj8CNNMWtwnCvwkU8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DTrFsylv9zMYywwlkRW+TGwjHWm+AJSNhYuHUrlsu6w=; b=YsgP7MSItZojXEMqk3VXVEFJUW
 bzn8EkmXyHsq6B5I4Sc90taT0chhpgT4l7A/KrfOhyChZVqyTODRQtXFXK1o99a66WZke2nRadqFq
 p+71EeA0eenYQcNtjtpLeAWzO/ufMGKV/RelRnKm89qoBKq40wraZAlBl2OjMoh8w25I=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jwLUk-00Bkco-Mn
 for kgdb-bugreport@lists.sourceforge.net; Fri, 17 Jul 2020 08:13:28 +0000
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C59A20737;
 Fri, 17 Jul 2020 08:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594973601;
 bh=rSVO2BTb16vlkwaWJc8QW+ptm9l+3pDdsWIF3geoCpA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VRgdt6qwooxrXbBq1itSh8u5wGHpvqjZlEoylasCHbCtPAzzyvp9qHKV7r8/Gg15P
 9zv9KIORNdWB7HwY6lXfmm5h6QwloW2kT1SY2dUXQszjOyNOcldjdJ4oPfVkGoTtjK
 LXq1EM+txPslclX9hLMECsNjoEk/M4rI4oMpMlOo=
Date: Fri, 17 Jul 2020 17:13:15 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: kernel test robot <lkp@intel.com>
Message-Id: <20200717171315.bdb7b5b230b0ed5aeeab8f71@kernel.org>
In-Reply-To: <202007170416.HyFlooXO%lkp@intel.com>
References: <20200716151943.2167652-2-daniel.thompson@linaro.org>
 <202007170416.HyFlooXO%lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: git-scm.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jwLUk-00Bkco-Mn
Subject: Re: [Kgdb-bugreport] [PATCH v2 1/3] kgdb: Honour the kprobe
 blocklist when setting breakpoints
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, kbuild-all@lists.01.org,
 pmladek@suse.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, sergey.senozhatsky@gmail.com,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, 17 Jul 2020 04:48:52 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Daniel,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on kgdb/kgdb-next pmladek/for-next v5.8-rc5 next-20200716]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Daniel-Thompson/kgdb-Honour-the-kprobe-blacklist-when-setting-breakpoints/20200716-232506
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f8456690ba8eb18ea4714e68554e242a04f65cff
> config: arm64-allyesconfig (attached as .config)
> compiler: aarch64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arm64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/net/wireless/intel/ipw2x00/ipw2100.c:3794:16: error: conflicting types for 'show_registers'
>     3794 | static ssize_t show_registers(struct device *d, struct device_attribute *attr,
>          |                ^~~~~~~~~~~~~~
>    In file included from include/linux/kgdb.h:19,
>                     from arch/arm64/include/asm/cacheflush.h:11,
>                     from include/linux/highmem.h:12,
>                     from include/linux/pagemap.h:11,
>                     from include/linux/blkdev.h:16,
>                     from include/linux/blk-cgroup.h:23,
>                     from include/linux/writeback.h:14,
>                     from include/linux/memcontrol.h:22,
>                     from include/net/sock.h:53,
>                     from include/linux/tcp.h:19,
>                     from drivers/net/wireless/intel/ipw2x00/ipw2100.c:144:
>    include/linux/kprobes.h:230:13: note: previous declaration of 'show_registers' was here
>      230 | extern void show_registers(struct pt_regs *regs);
>          |             ^~~~~~~~~~~~~~

It seems this function had been introduced before git, and forgot to removed from kprobes.h.

OK, commit 57da8b960b9a ("x86: Avoid double stack traces with show_regs()") renamed
show_registers() to show_regs() but forgot to remove old prototype in kprobes.h.

Anyway, we should remove it because kprobes doesn't use it anymore.

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
