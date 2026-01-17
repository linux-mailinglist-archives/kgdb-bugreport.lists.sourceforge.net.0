Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9D4D38CD6
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 17 Jan 2026 07:22:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWDEtClzhzi5gY4oa9HiPb/cLV00KCC+HeXugXXvkrs=; b=imLKtUsl0z+V9a95CsZ4ZzY+fb
	gLskOjtDARnSD0P7eR8GJ+tpfc0g9hxa+uQcuvFR+AMO0bedTRpqXuccqjEJQxyIPMFxe0MIAI3YW
	/v8xUKCfHltn6jXX8QvK+WaV5KlLcp8eMQNP7mxAmBMal/Fd3JXraKqgSvFYyvtYb8ss=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vgzi5-0004Te-LW
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 17 Jan 2026 06:22:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1vgzi3-0004TU-TP
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 17 Jan 2026 06:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1wmMsYUAk1kFdU0RfLSNV3fjUb4oIT7kyBeK513MjSU=; b=cko2nJ0fFRmtQbittySjtRh8oh
 2jGcBxKbT7wDO/NtYDoG9OsLdP5C5qCaYaea1yeRXGP63JszZiov5Rvcjk2PTw9w+/G/j3iMcEDYM
 /hbinh106053LbIlEs0+b7K6/hA3bdo+66FoH5G0vaCKHlHifCXE9+n5nyTbKTU+m4lo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1wmMsYUAk1kFdU0RfLSNV3fjUb4oIT7kyBeK513MjSU=; b=bYy9ERIFLXmanfCFLxZnYNSs2H
 bfb6LZGzJYRnG/6L6pLHMwx3ePdVosPLdq9v5K3iGt+dZL3jGp9WB+adFpS1/LdBqtDQgWs4ZxtDI
 TNQzWJAlzH844GBoLgMHSFt5/huCmCDyaLM2R/t7Z+rkdv5riMRHGuufeGgCKSAXzw0k=;
Received: from mgamail.intel.com ([198.175.65.18])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgzi3-0003dS-47 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 17 Jan 2026 06:22:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768630976; x=1800166976;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/FquNOusjZSaYbIZE0kdN18qpsdzltFYXA3evu19SSo=;
 b=acTeIti5ai1H/UL0EzOxzLLTUMg8e3OGq+Ap46dSKfUoaV6tkwY/cHaZ
 3dndT1VP9i5SHHm8ZO8yap7l2nYsY53Ip0uJQQ+ECJQL+jhbXyl4rrPlw
 oWrKewYOZ+C6a8CUI4oIYUfu5/oelwN4eCimUmxaJlB5aTgZLs9uMhRYo
 xFdQwVTwADXvY30F1uvvu8PHz8q2bxY2S+FwadvdusV8dB+I2Yle31EBt
 hJJSIaA58XUefaOJpWujVAlbJCOywYooTom0FEbVDCEL3Irt9ujAPPOIg
 JHt+pXCe8Jn1yCF+gU0icSfkKOEHS6Jg9nYuUZ2IiZhTAzNvDBRQhXs0s w==;
X-CSE-ConnectionGUID: Lf0NqpJeT7uioSOTW+tBmg==
X-CSE-MsgGUID: 9U0LuG41Tdik7dnTj62OHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69987907"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; d="scan'208";a="69987907"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 22:22:45 -0800
X-CSE-ConnectionGUID: IyrdKoFtSIyDNgKcW6DHRA==
X-CSE-MsgGUID: /VkcHJltTaeqY+luj4ow6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; d="scan'208";a="205319083"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 16 Jan 2026 22:22:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vgzho-00000000LcK-09Ex;
 Sat, 17 Jan 2026 06:22:40 +0000
Date: Sat, 17 Jan 2026 14:21:51 +0800
From: kernel test robot <lkp@intel.com>
To: Tim Bird <tim.bird@sony.com>, jason.wessel@windriver.com,
 danielt@kernel.org
Message-ID: <202601171457.nc8dNrA8-lkp@intel.com>
References: <20260117003621.669382-1-tim.bird@sony.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260117003621.669382-1-tim.bird@sony.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Tim,
 kernel test robot noticed the following build warnings:
 [auto build test WARNING on v6.19-rc5] [also build test WARNING on
 linus/master
 next-20260116] [If your patch is applied to the wrong git tree, kindly drop
 us a note. And when submitting patch, we sug [...] 
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
X-Headers-End: 1vgzi3-0003dS-47
Subject: Re: [Kgdb-bugreport] [PATCH] kernel: debug: Add SPDX license ids to
 kdb files
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-spdx@vger.kernel.org,
 Tim Bird <tim.bird@sony.com>, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Tim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.19-rc5]
[also build test WARNING on linus/master next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tim-Bird/kernel-debug-Add-SPDX-license-ids-to-kdb-files/20260117-083842
base:   v6.19-rc5
patch link:    https://lore.kernel.org/r/20260117003621.669382-1-tim.bird%40sony.com
patch subject: [PATCH] kernel: debug: Add SPDX license ids to kdb files
config: microblaze-defconfig (https://download.01.org/0day-ci/archive/20260117/202601171457.nc8dNrA8-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171457.nc8dNrA8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171457.nc8dNrA8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/debug/kdb/kdb_private.h:17,
                    from kernel/debug/kdb/kdb_io.c:23:
>> kernel/debug/kdb/../debug_core.h:2:1: warning: '/*' within comment [-Wcomment]
       2 | /*


vim +2 kernel/debug/kdb/../debug_core.h

53197fc4954924 Jason Wessel 2010-04-02 @2  /*
53197fc4954924 Jason Wessel 2010-04-02  3   * Created by: Jason Wessel <jason.wessel@windriver.com>
53197fc4954924 Jason Wessel 2010-04-02  4   *
53197fc4954924 Jason Wessel 2010-04-02  5   * Copyright (c) 2009 Wind River Systems, Inc.  All Rights Reserved.
53197fc4954924 Jason Wessel 2010-04-02  6   */
53197fc4954924 Jason Wessel 2010-04-02  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
