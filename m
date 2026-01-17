Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D31D38CFF
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 17 Jan 2026 07:44:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ozjdes4JMraLpfGMTaiPB6WLD2WO8079KKaDSQXbqyY=; b=OwDjdvxU/RzF2bIwFJNYly3pcB
	Y/iTSCrVmdvnwnt29e1noECId5HX79C58xOaBPgScrHELYAhpSNSPK4WKNZ5/aJNIvG2Wf+Likyk1
	VCtOdJTHgN9ZsQqtf8mdLItjODIZpaJ03V41T0gYSrEqJV4JRbKJdKQpVlBG0QY/jMlg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vh03O-00048d-DV
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 17 Jan 2026 06:44:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1vh03M-00048S-HM
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 17 Jan 2026 06:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V/NZQ4l7+wiCpJ9WKAKq5dJt/1Dd3eEqJptXaN6COvo=; b=YQKQKePxajXvALSmvrrnoAIUOB
 Be65W7id/Kj7O2s3KRkV7kRvY3swe0uUs1PxiznRO+JwqkySo8bxAmu8b/Sb7kMRH8Eks9+3gKM77
 2zTYMZ8Xo4QFd02wuJ6xEuByokglsgn8ey8ANqmSMaNRGolH/ZDfkxI2W71p9b9F5BbY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V/NZQ4l7+wiCpJ9WKAKq5dJt/1Dd3eEqJptXaN6COvo=; b=eEjOl7RO0vlv329s/+k0ONdZUy
 EkpuwHLrypuLJI3wt2DrprirUlyf2i/0rQdgSS96kMJtVeA44kBjwAAxa/q9aHsfCz+B7IlgMTqLI
 ZiLPo3lTlupNZ5D6FcK9MztFVIgZ3jBJX0knX5nRlreFPIyZ6A8n1+iAhsb7nGTIRS7k=;
Received: from mgamail.intel.com ([192.198.163.10])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vh03L-0004Tx-TI for kgdb-bugreport@lists.sourceforge.net;
 Sat, 17 Jan 2026 06:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768632296; x=1800168296;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=h5zEsATfnYScF22N+HZNR9SRqd2Wz8gbmo392H7S5jo=;
 b=n+7qupEXNumV2qx1ss60OMTxGrrSXtHMdKMKEnxo8MFnN/5rpTTULWTl
 /HvUTaEWvPI7Iu6PH7ojaTzqZQXiE8ScgMDBzr+5XxKtBV6lxJnkGbHeg
 LayRqRT8wgrjZ4KoytI97sWJIg3eCrdUUFeKdN2xOucAhtsrLvE6jxHt5
 wGtYoesTuud05cYloTFdmhmP/Q69YYBBdNiBzEBMtZjFI7Svbnwc0G67z
 CDjoaIhiMMu/0v4S/zmA4u4Yb9MFYIjkXrPuJD7v/LaC3rITdlwbRivHl
 nbUUK0n0rb0vhkAIFBCJhzNexw4TT6luDyVg6XFWKPW+ojRoms2w99t6l w==;
X-CSE-ConnectionGUID: tL8cjckGSHS8bcTSRAoD2g==
X-CSE-MsgGUID: INc240gEScSxtTC7XzaCWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="81308785"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; d="scan'208";a="81308785"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 22:44:45 -0800
X-CSE-ConnectionGUID: RrOnrlNdRzmGR0eHn+2eEw==
X-CSE-MsgGUID: dflrg5N6Tae84BQKUAXiWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; d="scan'208";a="210436377"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 16 Jan 2026 22:44:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vh036-00000000Ld6-2c23;
 Sat, 17 Jan 2026 06:44:40 +0000
Date: Sat, 17 Jan 2026 14:44:25 +0800
From: kernel test robot <lkp@intel.com>
To: Tim Bird <tim.bird@sony.com>, jason.wessel@windriver.com,
 danielt@kernel.org
Message-ID: <202601171534.EStWXGGO-lkp@intel.com>
References: <20260117003621.669382-1-tim.bird@sony.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260117003621.669382-1-tim.bird@sony.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vh03L-0004Tx-TI
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
config: sparc-randconfig-002-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171534.EStWXGGO-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171534.EStWXGGO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171534.EStWXGGO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/debug/gdbstub.c:38:
>> kernel/debug/debug_core.h:2:1: warning: "/*" within comment [-Wcomment]
    /*
     


vim +2 kernel/debug/debug_core.h

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
