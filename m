Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 748F2786119
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 23 Aug 2023 21:58:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qYu07-0000vh-8e
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 23 Aug 2023 19:58:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1qYu05-0000va-6P
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 23 Aug 2023 19:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pYeNMG9r7G7834FS6v/IbRZhOpmdgRW4cxeExPZF7Bo=; b=jJLaUUB9qYPob+fYZXx5DIHVeo
 ULTql2iejHS5M3QG9BppCNLwW2WKiMaD9QRb6DB8/xo3r63rL7OEUm38BYL0iOHHro5QBk55AD1/X
 bJmne8yDzEwYx+vwCn8Aaes8yO+N4Wa11ucqzzrwvGmgRsWcyV+w8wS9NZ+9RbK/GmoY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pYeNMG9r7G7834FS6v/IbRZhOpmdgRW4cxeExPZF7Bo=; b=muSDBaxTP0dfbWMIMzcY5xnRlG
 WNg5eczV1qeLMTh6lox0oP6OtusqGaFlt0Z9PupwzG1IgtvHa5df7qYmSz1DKJeKwAZ3nQy3diOwa
 i7zZ20YxfA4HKcJamD0bE6tWM3LyckWz1HZK7sk4b8XdPp1bHaElD7SzNa0MBVBaCAuU=;
Received: from mgamail.intel.com ([192.55.52.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qYu03-0000u4-J2 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 23 Aug 2023 19:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692820723; x=1724356723;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DWpi1WF0A7pyHfE5VmRDXpAMGPRbGG/nl9Ypmh1P914=;
 b=fiS0bYLjIOduThhocURhK/Oh1xOvjxz8EjNCi2flyOaJjF52EdsYqvUq
 WxK8eG6MSMbqZk9pq+83yzZVFKXY0/aooj3e/TUKuNAPQZ4CEo8eSXQbJ
 4lMiRoa0WSHl86f8CihgYYfC285Pb+bTFc9ulHMs5tW85g4ob0FPI3enz
 acHGFxbX53sb5/e4QyEiEmcakcZecpPIWdM1q9YfYpeewiAISV0PbuCu2
 qsJJENCB1+lyfgfZJU73hAl0ZjCVcbctlII+Vd9T2yPwxIAb42l39SZuV
 fyZ1BkUkMJsDGSbVY897zX/3fxHKfVwBy1xI0ZVpICS2SJxu6GuhhnmAX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="460619960"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="460619960"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 12:58:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="826848502"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="826848502"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Aug 2023 12:58:32 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qYtzj-0001Si-1b;
 Wed, 23 Aug 2023 19:58:27 +0000
Date: Thu, 24 Aug 2023 03:58:11 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Message-ID: <202308240309.hI0bjoys-lkp@intel.com>
References: <20230822142644.v10.4.Ie6c132b96ebbbcddbf6954b9469ed40a6960343c@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230822142644.v10.4.Ie6c132b96ebbbcddbf6954b9469ed40a6960343c@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Douglas, kernel test robot noticed the following build
 warnings: [auto build test WARNING on arm64/for-next/core] [also build test
 WARNING on tip/irq/core arm-perf/for-next/perf linus/master v6.5-rc7
 next-20230823]
 [If your patch is applied to the wrong git tree, k [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.43 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qYu03-0000u4-J2
Subject: Re: [Kgdb-bugreport] [PATCH v10 4/6] arm64: smp: Add arch support
 for backtrace using pseudo-NMI
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
Cc: Ingo Molnar <mingo@kernel.org>, Valentin Schneider <vschneid@redhat.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 D Scott Phillips <scott@os.amperecomputing.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, Josh Poimboeuf <jpoimboe@kernel.org>,
 ito-yuichi@fujitsu.com, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, oe-kbuild-all@lists.linux.dev,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Douglas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on tip/irq/core arm-perf/for-next/perf linus/master v6.5-rc7 next-20230823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Douglas-Anderson/irqchip-gic-v3-Enable-support-for-SGIs-to-act-as-NMIs/20230823-053216
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230822142644.v10.4.Ie6c132b96ebbbcddbf6954b9469ed40a6960343c%40changeid
patch subject: [PATCH v10 4/6] arm64: smp: Add arch support for backtrace using pseudo-NMI
config: arm64-randconfig-r026-20230823 (https://download.01.org/0day-ci/archive/20230824/202308240309.hI0bjoys-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240309.hI0bjoys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240309.hI0bjoys-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/smp.c:855:6: warning: no previous prototype for 'arm64_backtrace_ipi' [-Wmissing-prototypes]
     855 | void arm64_backtrace_ipi(cpumask_t *mask)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/arm64_backtrace_ipi +855 arch/arm64/kernel/smp.c

   854	
 > 855	void arm64_backtrace_ipi(cpumask_t *mask)
   856	{
   857		__ipi_send_mask(ipi_desc[IPI_CPU_BACKTRACE], mask);
   858	}
   859	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
