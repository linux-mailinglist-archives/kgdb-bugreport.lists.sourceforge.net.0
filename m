Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F01B21A4CBA
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 11 Apr 2020 01:56:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jN3Vq-0005Dj-P4
	for lists+kgdb-bugreport@lfdr.de; Fri, 10 Apr 2020 23:56:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <lkp@intel.com>) id 1jN3Vp-0005DY-LQ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Apr 2020 23:56:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z0ZAx0bDfzBe2N8jVuhhTeFjEP2ygUANe9ZhNZv9Og8=; b=DWPqSez0WyQpYuoRUECjhziIUI
 6rt3ZYQUnExrozqLKEg23xUlkynwdCbm3KYp/2wZRlJ3ePgsKWIVof/IE1m1s2ZwcKdtrA+u4GjiX
 k5YuV+6bVAThynQzXE8uYq+Wjee+DZamFQsS95iiQG5VmtnWUPg9uSNz0xiBBMFILpFc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z0ZAx0bDfzBe2N8jVuhhTeFjEP2ygUANe9ZhNZv9Og8=; b=IbjU1nnk8eTuQ6Om+sCjx0oLdl
 8Lu/pC/PQBwIQl+N0nRNgoEVisPdfk6q6k41l2gHl5qAZW38u0sUGM470e8rq0g5vm0N1UQ/5rk0X
 31TrIw6Me0wPwKy90mi7+Zm3fbIcPfWdFoDEfBsgZ/7FNnu4SrXL+SiiQq3a5tFZZ5GQ=;
Received: from mga02.intel.com ([134.134.136.20])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jN3Vi-00Em1U-Pu
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Apr 2020 23:56:41 +0000
IronPort-SDR: 7HpM0fTXW1cgiZXkwoDKYw3dilPbvpdAkQFqjl5ERrn/CezIrYj7AUbxj9N8tVffKr7DHqzgYN
 4W60Ms4EHbdw==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2020 16:56:28 -0700
IronPort-SDR: wBgQ2nVr1uE4WKxqrSNvhduGxgcOvGGeq6xYcEZCjZ2ulzCQKSZPYV/OJ2MIPCv3HVsNuxl0jY
 yhpON0u4w0Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,368,1580803200"; 
 d="gz'50?scan'50,208,50";a="362580567"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 10 Apr 2020 16:56:23 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jN3VW-000HeJ-Pw; Sat, 11 Apr 2020 07:56:22 +0800
Date: Sat, 11 Apr 2020 07:56:16 +0800
From: kbuild test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <202004110744.nPoRwmTD%lkp@intel.com>
References: <20200410151632.4.I8fba5961bf452ab92350654aa61957f23ecf0100@changeid>
MIME-Version: 1.0
In-Reply-To: <20200410151632.4.I8fba5961bf452ab92350654aa61957f23ecf0100@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: githubusercontent.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [134.134.136.20 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jN3Vi-00Em1U-Pu
Content-Disposition: inline
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
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
Cc: daniel.thompson@linaro.org, kbuild-all@lists.01.org, will@kernel.org,
 corbet@lwn.net, kgdb-bugreport@lists.sourceforge.net, hpa@zytor.com,
 agross@kernel.org, bjorn.andersson@linaro.org, jason.wessel@windriver.com,
 catalin.marinas@arm.com, mingo@redhat.com, bp@alien8.de,
 linux-serial@vger.kernel.org, gregkh@linuxfoundation.org, jslaby@suse.com,
 tglx@linutronix.de, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Douglas,

I love your patch! Yet something to improve:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on tty/tty-testing v5.6 next-20200410]
[cannot apply to kgdb/kgdb-next]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Douglas-Anderson/kgdb-Support-late-serial-drivers-enable-early-debug-w-boot-consoles/20200411-062123
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
config: microblaze-mmu_defconfig (attached as .config)
compiler: microblaze-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=9.3.0 make.cross ARCH=microblaze 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/misc/kgdbts.c: In function 'configure_kgdbts':
>> drivers/misc/kgdbts.c:1080:8: error: too few arguments to function 'kgdb_register_io_module'
    1080 |  err = kgdb_register_io_module(&kgdbts_io_ops);
         |        ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/misc/kgdbts.c:86:
   include/linux/kgdb.h:326:12: note: declared here
     326 | extern int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops,
         |            ^~~~~~~~~~~~~~~~~~~~~~~

vim +/kgdb_register_io_module +1080 drivers/misc/kgdbts.c

e8d31c204e36e0 Jason Wessel 2008-03-07  1069  
e8d31c204e36e0 Jason Wessel 2008-03-07  1070  static int configure_kgdbts(void)
e8d31c204e36e0 Jason Wessel 2008-03-07  1071  {
e8d31c204e36e0 Jason Wessel 2008-03-07  1072  	int err = 0;
e8d31c204e36e0 Jason Wessel 2008-03-07  1073  
e8d31c204e36e0 Jason Wessel 2008-03-07  1074  	if (!strlen(config) || isspace(config[0]))
e8d31c204e36e0 Jason Wessel 2008-03-07  1075  		goto noconfig;
e8d31c204e36e0 Jason Wessel 2008-03-07  1076  
e8d31c204e36e0 Jason Wessel 2008-03-07  1077  	final_ack = 0;
e8d31c204e36e0 Jason Wessel 2008-03-07  1078  	run_plant_and_detach_test(1);
e8d31c204e36e0 Jason Wessel 2008-03-07  1079  
e8d31c204e36e0 Jason Wessel 2008-03-07 @1080  	err = kgdb_register_io_module(&kgdbts_io_ops);
e8d31c204e36e0 Jason Wessel 2008-03-07  1081  	if (err) {
e8d31c204e36e0 Jason Wessel 2008-03-07  1082  		configured = 0;
e8d31c204e36e0 Jason Wessel 2008-03-07  1083  		return err;
e8d31c204e36e0 Jason Wessel 2008-03-07  1084  	}
e8d31c204e36e0 Jason Wessel 2008-03-07  1085  	configured = 1;
e8d31c204e36e0 Jason Wessel 2008-03-07  1086  	kgdbts_run_tests();
e8d31c204e36e0 Jason Wessel 2008-03-07  1087  
e8d31c204e36e0 Jason Wessel 2008-03-07  1088  	return err;
e8d31c204e36e0 Jason Wessel 2008-03-07  1089  
e8d31c204e36e0 Jason Wessel 2008-03-07  1090  noconfig:
e8d31c204e36e0 Jason Wessel 2008-03-07  1091  	config[0] = 0;
e8d31c204e36e0 Jason Wessel 2008-03-07  1092  	configured = 0;
e8d31c204e36e0 Jason Wessel 2008-03-07  1093  
e8d31c204e36e0 Jason Wessel 2008-03-07  1094  	return err;
e8d31c204e36e0 Jason Wessel 2008-03-07  1095  }
e8d31c204e36e0 Jason Wessel 2008-03-07  1096  

:::::: The code at line 1080 was first introduced by commit
:::::: e8d31c204e36e019b9134f2a11926cac0fcf9b19 kgdb: add kgdb internal test suite

:::::: TO: Jason Wessel <jason.wessel@windriver.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
