Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB21B02EFA
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 13 Jul 2025 08:44:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owGOzCgWQuMC1Jsx3NAvtjZHx96s20bLG7Vtw6IbbjE=; b=Y6QulMyYnzfXVJpZvWUscPPyX9
	MATm/efw/LQtlxe3F9EhAP5CcISkMrU41NTdLI6sYHWWtuACtsu07TTu9BZjgqX1vXNZM9QgeS/kH
	2iBUoQzEwMa0yVdecwEK3vtVjaU4tVK5h9tlbHLke4yxoYNUg4HR1i7ZJ/CzyJIMJ9W0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uaqRh-0002R0-0e
	for lists+kgdb-bugreport@lfdr.de;
	Sun, 13 Jul 2025 06:44:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1uaqRg-0002Qu-2X
 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 13 Jul 2025 06:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kAwi04oM7NBV71zC0eZ/+nV73FBCi6GL/LiFfIycWoE=; b=H2EFkM848E5uJd4hrhiazCq5CR
 5apsRtwLJYf/OQae6Or676fITioahGEJjVharR1o6zd0pQRp9FMK54cy67YXm6IO7qxfTzi/dglj5
 EhhL538AFfgNVgDslMSj2Vmfzd4RB3Q4k9Y/Zq5DGUp0f6FAZ6dfCq1clr3Jfp5Wr44Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kAwi04oM7NBV71zC0eZ/+nV73FBCi6GL/LiFfIycWoE=; b=KcrxdqiPLZ15GGt3CrnBEq2bea
 dJc5L3i2GvLHTUMYDeMYKW65MmjzV87+/ZkL5CHDGNZ7+64LouMQ7TLqFj8Lvy8NYF8IfZ+I/xosG
 wzWVH8dN3wu+IQ0xrGjtvrwes8vNf/8kq/8hoqJD1HLgEE5Z9ZannAqLPVXixiRVAC1c=;
Received: from mgamail.intel.com ([198.175.65.13])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uaqRf-0001AK-Fc for kgdb-bugreport@lists.sourceforge.net;
 Sun, 13 Jul 2025 06:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752389059; x=1783925059;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=V7drxRajC6ozX9k3goWA4uOuO9/Qm6hwvlFiPiFyt1A=;
 b=WLQ8M6Bf6NwCUhP24k1yhwRjG/CDh+xINXTkCDf6qdpLNnQEdX1slzct
 0RFFcKRgtmb0JrjXQS+JaICY40z6HhhcsxN1ARr26YBOLQCq0tRscP4Lt
 +rxDVbYK1cbSy2TgZTy76cKHb4SwTNfEHsE4BcJwIOSIRlU4jCPv1xmAz
 yLjLInBhVRcdaXuC6bMgRECgG70YHI8BVCLB+HVt98vtiaQ5B2cq2MjfE
 8uXMAqFJs7vsoQ8ynhxCy/3Wu3cYUqhdejoHRlh1IunXTlsSLgH4PAoiZ
 qppJfh/H8YMor2Y29O2HnZe6BHnPOfEZxi4u6exHt9/oOE6uenePSFC/n w==;
X-CSE-ConnectionGUID: kLA2FVsDSjKyORUmtmromA==
X-CSE-MsgGUID: yu3yBstTTFiw1kzYTsaynQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65682780"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; d="scan'208";a="65682780"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2025 23:44:13 -0700
X-CSE-ConnectionGUID: Q5qA7GjMTlyJWaItVFLZQQ==
X-CSE-MsgGUID: vgPnHmhcRDCs3fcgIVIAfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; d="scan'208";a="162353828"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 12 Jul 2025 23:44:10 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uaqRT-0007wt-2L;
 Sun, 13 Jul 2025 06:44:07 +0000
Date: Sun, 13 Jul 2025 14:43:13 +0800
From: kernel test robot <lkp@intel.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>
Message-ID: <202507131443.p6jEjXFw-lkp@intel.com>
References: <20250713-nbcon-kgdboc-v1-1-51eccd9247a8@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250713-nbcon-kgdboc-v1-1-51eccd9247a8@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Marcos,
 kernel test robot noticed the following build warnings:
 [auto build test WARNING on d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uaqRf-0001AK-Fc
Subject: Re: [Kgdb-bugreport] [PATCH 1/2] printk: nbcon: Export
 console_is_usage and other nbcon symbols
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
Cc: kgdb-bugreport@lists.sourceforge.net, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>,
 oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Marcos,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcos-Paulo-de-Souza/printk-nbcon-Export-console_is_usage-and-other-nbcon-symbols/20250713-131106
base:   d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
patch link:    https://lore.kernel.org/r/20250713-nbcon-kgdboc-v1-1-51eccd9247a8%40suse.com
patch subject: [PATCH 1/2] printk: nbcon: Export console_is_usage and other nbcon symbols
config: x86_64-buildonly-randconfig-001-20250713 (https://download.01.org/0day-ci/archive/20250713/202507131443.p6jEjXFw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507131443.p6jEjXFw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507131443.p6jEjXFw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm_tis.c:21:
   In file included from include/linux/pnp.h:16:
>> include/linux/console.h:653:76: warning: non-void function does not return a value [-Wreturn-type]
     653 | static inline bool nbcon_context_try_acquire(struct nbcon_context *ctxt) { }
         |                                                                            ^
   In file included from drivers/char/tpm/tpm_tis.c:29:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
   2 warnings generated.


vim +653 include/linux/console.h

   651	
   652	#else
 > 653	static inline bool nbcon_context_try_acquire(struct nbcon_context *ctxt) { }
   654	static inline void nbcon_context_release(struct nbcon_context *ctxt) { }
   655	static inline void nbcon_cpu_emergency_enter(void) { }
   656	static inline void nbcon_cpu_emergency_exit(void) { }
   657	static inline bool nbcon_can_proceed(struct nbcon_write_context *wctxt) { return false; }
   658	static inline bool nbcon_enter_unsafe(struct nbcon_write_context *wctxt) { return false; }
   659	static inline bool nbcon_exit_unsafe(struct nbcon_write_context *wctxt) { return false; }
   660	static inline void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt) { }
   661	static inline bool console_is_usable(struct console *con, short flags,
   662					     bool use_atomic) { return false; }
   663	#endif
   664	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
