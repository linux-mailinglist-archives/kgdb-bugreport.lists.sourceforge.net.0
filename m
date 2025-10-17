Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04842BE6082
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 17 Oct 2025 03:26:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Da9+GwyyolKTZlLRX7eO3OqNUuLmnmNLXsE9b8was4=; b=BfFJ4JlLY4C9zAsfl4hlaMkF1j
	P3ZKpkVkKj32mu5DOM3FMKbJmUFdUNsNMEMPKxXqo7REtP9Kc3rk0Kl1iCW7IJ/ieplmxHMvCJy29
	DevkB33I8K4T+DGaOc1alt7PKHAjRNEPpkEYJr7X4d1OBdR/NuseQDFtVoULs5IquXpY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1v9ZEr-0004Nr-PU
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 17 Oct 2025 01:26:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1v9ZEq-0004Nk-Gu
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 17 Oct 2025 01:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sqAnkw3PiOi1j4s6CuolE99ttryngSmpW8X9kFTObzA=; b=BtoAHR43dLSVtuCagJhMYn+ek4
 eGwa0qPsojsGLNXo6F0iz2AXganfpoHGJRNNgj4vp2NBGlZppypzLwzXZJD+Wz8gfs9Ec9Wv+YI2N
 4//cBoR2uZTqOB2aMRLdHmKpE1nXZMISBj6CeurP6gc2KwbVxf4LMijITjcYCJk9swLA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sqAnkw3PiOi1j4s6CuolE99ttryngSmpW8X9kFTObzA=; b=D62jzyyGDprJMTWA3Ev7GpW3/f
 fnYYQ2wmZduC3woAsa5OGWG465kYeV9Lq9/t8fVI2qt9tE6V6cc4BUH0h2PMcmXdCUZa3LSdKqF0K
 /v8mvCBC/FEZQ8RGisnCNAC+Evi2r4eZEyM7Iu7Wb0dFqP1S51s7GFdnCUQxW5FpULkE=;
Received: from mgamail.intel.com ([198.175.65.15])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v9ZEp-0002E7-Ou for kgdb-bugreport@lists.sourceforge.net;
 Fri, 17 Oct 2025 01:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760664396; x=1792200396;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8yqxrPMDUDIopjMpMaVfn56rVVvt//g54hut99p+kBE=;
 b=ZEtQKJQm/Jpkai6RpZuSo8+SIAPXrImSUiOC9IXfMsNyvIsyeo/dLwOO
 BRqYc4vuD/c1n1Jf+5WVbPo0UmDGX12QKDVOchlbUc4UTIkYBgU8xq/UV
 EfzMWsNMzI9tbyceYxDkJmaPGX75q+s18NzgiQG/olZ1fHBspZazzF2QJ
 2EgTSJfa1wNbsR2HH+YzXkKXZq8Z34ylXGQPfRJQGtQL4tlFpXrq0LCKq
 RpoBZLDJuoIlKZqigdD0Rn1ceWXNASnlgtSdcomNV+QRk/mnlswn15Hqv
 38iW8AuGAiwxJMEVAy2ecanQWBPQW7pMBPKuGOH6MigZs2Iogqqr/Q+5n g==;
X-CSE-ConnectionGUID: hCkORbdPTpCEr3R2POBagw==
X-CSE-MsgGUID: C77FEJUnT06YY/QDB7eyUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66517232"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66517232"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 18:26:25 -0700
X-CSE-ConnectionGUID: Team0iFbSKqfERnQjCcG/Q==
X-CSE-MsgGUID: 0W2mbKcvRo6bgWR+5Q+jtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="181742346"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa006.jf.intel.com with ESMTP; 16 Oct 2025 18:26:22 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v9ZEZ-0005P1-2Q;
 Fri, 17 Oct 2025 01:26:19 +0000
Date: Fri, 17 Oct 2025 09:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>
Message-ID: <202510170949.NTx9lt0p-lkp@intel.com>
References: <20251016-nbcon-kgdboc-v6-3-866aac60a80e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251016-nbcon-kgdboc-v6-3-866aac60a80e@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Marcos,
 kernel test robot noticed the following build errors:
 [auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v9ZEp-0002E7-Ou
Subject: Re: [Kgdb-bugreport] [PATCH v6 3/5] printk: nbcon: Allow KDB to
 acquire the NBCON context
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
 Marcos Paulo de Souza <mpdesouza@suse.com>, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Marcos,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcos-Paulo-de-Souza/printk-nbcon-Export-console_is_usable/20251016-225503
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251016-nbcon-kgdboc-v6-3-866aac60a80e%40suse.com
patch subject: [PATCH v6 3/5] printk: nbcon: Allow KDB to acquire the NBCON context
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20251017/202510170949.NTx9lt0p-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170949.NTx9lt0p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510170949.NTx9lt0p-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/kallsyms.c:19:
   include/linux/kdb.h: In function 'kdb_printf_on_this_cpu':
>> include/linux/kdb.h:229:63: error: expected ';' before '}' token
     229 | static inline bool kdb_printf_on_this_cpu(void) { return false };
         |                                                               ^~
         |                                                               ;


vim +229 include/linux/kdb.h

   228	
 > 229	static inline bool kdb_printf_on_this_cpu(void) { return false };
   230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
