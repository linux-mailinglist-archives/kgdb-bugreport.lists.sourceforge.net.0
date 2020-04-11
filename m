Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 678251A4D56
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 11 Apr 2020 03:45:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jN5DO-0004vB-6r
	for lists+kgdb-bugreport@lfdr.de; Sat, 11 Apr 2020 01:45:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <lkp@intel.com>) id 1jN5DL-0004uq-Lw
 for kgdb-bugreport@lists.sourceforge.net; Sat, 11 Apr 2020 01:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bhpUrVRYRqElxrHaP86qrlNJ0qeK1x0Xd4mUHwjWyz4=; b=AmmAgzdJiUEHzh2CB+kYn9Ib61
 1sLFt4+G8Z+ngYvkMi2f3TK6xPv8n9OSsNKafGoz3VTBp9rQS524m//yShRiKxgaWj6xYtHEqb/o6
 G8lMqKlH7at7zZKLkmzu4ZQHdBMDsNPcbA1DbWmY+qCSo09BR8U2L5fqZIKftYVvaCKs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bhpUrVRYRqElxrHaP86qrlNJ0qeK1x0Xd4mUHwjWyz4=; b=QhJ6UqSAlGbL6B1QeUaDKuE2xm
 OLLk/j6lRl3lD1qO/vV6WNApbjElDwarAbUB6F+fwrsk/hXL9xtIHIFsZ78DiV2wmb2ZsKkKF7uTy
 +bDFRQyX2lzIRU1fCWl0UO3Z5fFVjpIoFnhPT6TYdmYXjebASxzadn3crsNwvvmYrfr8=;
Received: from mga18.intel.com ([134.134.136.126])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jN5DH-00Ep61-Rw
 for kgdb-bugreport@lists.sourceforge.net; Sat, 11 Apr 2020 01:45:43 +0000
IronPort-SDR: XU2ZTeihNz5jHc0k0m7xkcJMrjJFbtIrEJHtqfc9ARJ/25s3ET4mGBX58kUyL9wmVeEiDDxreA
 Bi3B2jl6HT+A==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2020 18:45:33 -0700
IronPort-SDR: s9cttaJxGUMc/++W8VQef1a2baIZatX1qPV2Q8wLG7pzgXvOHQOF2Cv2QvvLeJ7DOVIAmUga2w
 6eflmS/EIBew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,368,1580803200"; 
 d="gz'50?scan'50,208,50";a="426087418"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 10 Apr 2020 18:45:28 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jN5D5-0001rg-Ra; Sat, 11 Apr 2020 09:45:27 +0800
Date: Sat, 11 Apr 2020 09:44:40 +0800
From: kbuild test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <202004110910.bzdcPg1o%lkp@intel.com>
References: <20200410151632.4.I8fba5961bf452ab92350654aa61957f23ecf0100@changeid>
MIME-Version: 1.0
In-Reply-To: <20200410151632.4.I8fba5961bf452ab92350654aa61957f23ecf0100@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: windriver.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jN5DH-00Ep61-Rw
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
config: i386-allyesconfig (attached as .config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/usb/early/ehci-dbgp.c: In function 'kgdbdbgp_parse_config':
>> drivers/usb/early/ehci-dbgp.c:1060:2: error: too few arguments to function 'kgdb_register_io_module'
     kgdb_register_io_module(&kgdbdbgp_io_ops);
     ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/usb/early/ehci-dbgp.c:24:0:
   include/linux/kgdb.h:326:12: note: declared here
    extern int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops,
               ^~~~~~~~~~~~~~~~~~~~~~~

vim +/kgdb_register_io_module +1060 drivers/usb/early/ehci-dbgp.c

4fe1da4ebc18c4 Jason Wessel 2010-05-20  1046  
4fe1da4ebc18c4 Jason Wessel 2010-05-20  1047  static int __init kgdbdbgp_parse_config(char *str)
4fe1da4ebc18c4 Jason Wessel 2010-05-20  1048  {
4fe1da4ebc18c4 Jason Wessel 2010-05-20  1049  	char *ptr;
4fe1da4ebc18c4 Jason Wessel 2010-05-20  1050  
4fe1da4ebc18c4 Jason Wessel 2010-05-20  1051  	if (!ehci_debug) {
4fe1da4ebc18c4 Jason Wessel 2010-05-20  1052  		if (early_dbgp_init(str))
4fe1da4ebc18c4 Jason Wessel 2010-05-20  1053  			return -1;
4fe1da4ebc18c4 Jason Wessel 2010-05-20  1054  	}
4fe1da4ebc18c4 Jason Wessel 2010-05-20  1055  	ptr = strchr(str, ',');
4fe1da4ebc18c4 Jason Wessel 2010-05-20  1056  	if (ptr) {
4fe1da4ebc18c4 Jason Wessel 2010-05-20  1057  		ptr++;
4fe1da4ebc18c4 Jason Wessel 2010-05-20  1058  		kgdbdbgp_wait_time = simple_strtoul(ptr, &ptr, 10);
4fe1da4ebc18c4 Jason Wessel 2010-05-20  1059  	}
4fe1da4ebc18c4 Jason Wessel 2010-05-20 @1060  	kgdb_register_io_module(&kgdbdbgp_io_ops);
4fe1da4ebc18c4 Jason Wessel 2010-05-20  1061  	kgdbdbgp_io_ops.is_console = early_dbgp_console.index != -1;
4fe1da4ebc18c4 Jason Wessel 2010-05-20  1062  
4fe1da4ebc18c4 Jason Wessel 2010-05-20  1063  	return 0;
4fe1da4ebc18c4 Jason Wessel 2010-05-20  1064  }
4fe1da4ebc18c4 Jason Wessel 2010-05-20  1065  early_param("kgdbdbgp", kgdbdbgp_parse_config);
4fe1da4ebc18c4 Jason Wessel 2010-05-20  1066  

:::::: The code at line 1060 was first introduced by commit
:::::: 4fe1da4ebc18c4c42fa56c228447f68033fce5f0 echi-dbgp: Add kernel debugger support for the usb debug port

:::::: TO: Jason Wessel <jason.wessel@windriver.com>
:::::: CC: Jason Wessel <jason.wessel@windriver.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
