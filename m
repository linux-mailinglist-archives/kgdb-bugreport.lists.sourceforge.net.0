Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEC3B43A52
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  4 Sep 2025 13:36:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/z5X0QKAPI/JQnBSqTM7mVPnaxBIqBvxP8kRFKHPFk=; b=IsZSFSBTY+1QCVqfVKhnj2FF82
	chEjDd+0Hj7HzIlDX/ty0HVuECUy7dbI+earCk6Ed9d7bU+LD1P9i2QRXW9IynmjJ6NYxPGl7Cc76
	60LRemBUbsHI39yD49IHHSjoWiHzFSfbtWQw/Rz2q6bGwFfkHkhZpp1KOftQbDHVmDPk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uu8GB-0003e0-GL
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 04 Sep 2025 11:36:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1uu8GA-0003du-Kh
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 Sep 2025 11:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RbNfKfYj7bIPOgQI7SUd92S2KUUH1QYayBvdXe0MGbQ=; b=dXSTKPPoj+QYo5giz2lH1JVeR0
 J0XHwbMHrywSsIhiD+CfjJdFfJQYP4lEcHoCvgd0V6bMdNnbS9xC/fUWqyq6so1/oSR5004o4DueN
 BmxDn8GYQYpPZBI/1vNl/RP7XXc6s/8VAnLa7NucpXaklR4aSKfKtfV9+8tYval4iR98=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RbNfKfYj7bIPOgQI7SUd92S2KUUH1QYayBvdXe0MGbQ=; b=Dq+q5X2hwXClhNsB4JVlncubVd
 3QlBm5uAGNr6WkjiWKBrKbQI+TveoeeCdkLNTBHcw/MknTt1zFarQCqbhFKcumtNVa/47woGsphxC
 YcXqR+I5y3jR+5IUPf/eoppEixr/3ItkFt3znPgx6vE4kbO6ZWnJDqdJDYu9coSua2WA=;
Received: from mgamail.intel.com ([198.175.65.13])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uu8G9-0007eC-W3 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 Sep 2025 11:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756985770; x=1788521770;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XooMgB/G8lNJMCdIzzBtmWjZeeaz3fKqex6i/QbgCAs=;
 b=Tw4W6DjV+FqOKQt68QQUd+h20F3SKwXTMM7xUJ9ER21GdtXQDcY5TFB8
 kM3gCjxcdrcDamPAXGSPMdahELnm1puRXDSPo2/7j4pbHZMztKZTeMUw2
 7EG41EBm4SWLQ9KgjJomBkW3u3j9CBGLcZ/BkY3SMVj4TansNm5rxBbs6
 QTFkuXrWaXKEhwsEQ/HRwuO5E+QGjt6RTYyRbUwvqlbVcS3FT3H/qGcdx
 ZF9qVVeNJ9vIgeTSmQHWQpbF/gjNwujHDQp0Kpf0DqOzpZULB2+qLGYIq
 ewrEz5nn6VsI1mg1RqcjV2F4rf1f1XR1nFanYAFwc014a+kPUYDT/FbiS w==;
X-CSE-ConnectionGUID: lBturqp0RLarPd4m27gCVg==
X-CSE-MsgGUID: Y3fW0Mb/T1SSc9hP+RNIsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="70416300"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="70416300"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 04:36:04 -0700
X-CSE-ConnectionGUID: 2HCD2rLNSbiGPoee94Y5lg==
X-CSE-MsgGUID: Tg6EjqbvT3+7BOniHFVSmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="176228730"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
 by fmviesa005.fm.intel.com with ESMTP; 04 Sep 2025 04:36:02 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uu8F0-0005AJ-3B;
 Thu, 04 Sep 2025 11:35:18 +0000
Date: Thu, 4 Sep 2025 19:32:53 +0800
From: kernel test robot <lkp@intel.com>
To: Fidal Palamparambil <palamparambilfidal089@gmail.com>,
 kgdb-bugreport@lists.sourceforge.net
Message-ID: <202509041912.qtRHikwE-lkp@intel.com>
References: <20250903174657.1689-1-hellomystoryswherei@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250903174657.1689-1-hellomystoryswherei@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Fidal,
 kernel test robot noticed the following build warnings:
 [auto build test WARNING on linus/master] [also build test WARNING on
 v6.17-rc4
 next-20250904] [If your patch is applied to the wrong git tree, kindly drop
 us a note. And when submitting patch, we sug [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uu8G9-0007eC-W3
Subject: Re: [Kgdb-bugreport] [PATCH] media: pci: Add core driver for
 Techwell TW68xx video capture devices
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
Cc: daniel.thompson@linaro.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 Fidal Palamparambil <hellomystoryswherei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Fidal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.17-rc4 next-20250904]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fidal-Palamparambil/media-pci-Add-core-driver-for-Techwell-TW68xx-video-capture-devices/20250904-014821
base:   linus/master
patch link:    https://lore.kernel.org/r/20250903174657.1689-1-hellomystoryswherei%40gmail.com
patch subject: [PATCH] media: pci: Add core driver for Techwell TW68xx video capture devices
config: i386-buildonly-randconfig-006-20250904 (https://download.01.org/0day-ci/archive/20250904/202509041912.qtRHikwE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509041912.qtRHikwE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509041912.qtRHikwE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/tw68/tw68-core.c:381:18: warning: unused variable 'pci_dev' [-Wunused-variable]
     381 |         struct pci_dev *pci_dev = to_pci_dev(dev_d);
         |                         ^~~~~~~
   1 warning generated.


vim +/pci_dev +381 drivers/media/pci/tw68/tw68-core.c

   378	
   379	static int __maybe_unused tw68_resume(struct device *dev_d)
   380	{
 > 381		struct pci_dev *pci_dev = to_pci_dev(dev_d);
   382		struct v4l2_device *v4l2_dev = dev_get_drvdata(dev_d);
   383		struct tw68_dev *dev = container_of(v4l2_dev, struct tw68_dev, v4l2_dev);
   384		struct tw68_buf *buf;
   385		unsigned long flags;
   386	
   387		/* Do things that are done in tw68_initdev,
   388		 * except for initializing memory structures.
   389		 */
   390		msleep(100);
   391	
   392		tw68_hw_init1(dev);
   393		tw68_set_tvnorm_hw(dev);
   394	
   395		/* Restore interrupt mask */
   396		tw_setl(TW68_INTMASK, dev->pci_irqmask);
   397	
   398		/* Resume unfinished buffer(s) */
   399		spin_lock_irqsave(&dev->slock, flags);
   400		if (!list_empty(&dev->active)) {
   401			buf = container_of(dev->active.next, struct tw68_buf, list);
   402			tw68_video_start_dma(dev, buf);
   403		}
   404		spin_unlock_irqrestore(&dev->slock, flags);
   405	
   406		return 0;
   407	}
   408	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
