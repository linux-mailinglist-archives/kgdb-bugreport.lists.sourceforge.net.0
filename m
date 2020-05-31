Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C1E1E95CA
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 31 May 2020 07:28:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jfGWI-0000hd-7F
	for lists+kgdb-bugreport@lfdr.de; Sun, 31 May 2020 05:28:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <lkp@intel.com>) id 1jfGWG-0000hR-T5
 for kgdb-bugreport@lists.sourceforge.net; Sun, 31 May 2020 05:28:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7JUjzD4aCHrk9BIkBOar6gKGT1vU/Q9tunXwlOHPII0=; b=brWkc9WAgyDKhBgNnastxTnxUC
 ZSE9Bv2cRo+D8PJACIqGagjOuqWm16JFisPByWLXh1Ogx4cJXav9F/17QCFRlvGIxfYkB2joQ+2w+
 sPZmL+U85zkqzNC4xUWzgaMHObyGaHAJCXqK+vxjp8+VdlyMaET1OhgMdsFho7L1X+O4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7JUjzD4aCHrk9BIkBOar6gKGT1vU/Q9tunXwlOHPII0=; b=KKqQOP+O1R8dl5WDGou7oevVpd
 XF4gPVgTaqoFyew96NEIBKI9RvowaxrbHbwQkpkBwBuzVTc+4plP34c+iAsEZayvXfgeqqGeVdj98
 fmK2G9eCgJGs/SiQRCTXlCTCx6gTUvvu/FezktGpkhxZ8vh3x5aoCBE/eJ8LNE2fOQk8=;
Received: from mga01.intel.com ([192.55.52.88])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jfGWE-00Ec0l-E0
 for kgdb-bugreport@lists.sourceforge.net; Sun, 31 May 2020 05:28:24 +0000
IronPort-SDR: 9+q60eCF1uEV044ysUvvMLjQlfl/0oKR+YsnL7x7etuDEfO3CUsazMS0rmV7R47HKsU6x6+sFv
 2VR31XePU2dg==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2020 22:28:15 -0700
IronPort-SDR: CejDs0tYI6S3WK/c04hFxtkhUTSgdYepO09j63hCLq47NaYnk1F5yNXdF7iXB6HB27sydp93oS
 OGiyCa0CFYbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,455,1583222400"; 
 d="gz'50?scan'50,208,50";a="256457529"
Received: from lkp-server01.sh.intel.com (HELO 9f9df8056aac) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 30 May 2020 22:28:12 -0700
Received: from kbuild by 9f9df8056aac with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jfGW3-0000ts-DP; Sun, 31 May 2020 05:28:11 +0000
Date: Sun, 31 May 2020 13:27:23 +0800
From: kbuild test robot <lkp@intel.com>
To: Sumit Garg <sumit.garg@linaro.org>, daniel.thompson@linaro.org
Message-ID: <202005311324.We2amqkp%lkp@intel.com>
References: <1590751607-29676-5-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1590751607-29676-5-git-send-email-sumit.garg@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [192.55.52.88 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: stackoverflow.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jfGWE-00Ec0l-E0
Content-Disposition: inline
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Kgdb-bugreport] [PATCH v4 4/4] kdb: Switch to use safer
 dbg_io_ops over console APIs
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
Cc: pmladek@suse.com, kbuild-all@lists.01.org, sergey.senozhatsky@gmail.com,
 kgdb-bugreport@lists.sourceforge.net, jslaby@suse.com,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 gregkh@linuxfoundation.org, jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Sumit,

I love your patch! Yet something to improve:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on usb/usb-testing v5.7-rc7 next-20200529]
[cannot apply to kgdb/kgdb-next]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Sumit-Garg/kdb-Improve-console-handling/20200531-075431
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
config: x86_64-allyesconfig (attached as .config)
compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 2388a096e7865c043e83ece4e26654bd3d1a20d5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> drivers/usb/early/ehci-dbgp.c:1062:24: error: assigning to 'struct console *' from incompatible type 'struct console'; take the address with &
kgdbdbgp_io_ops.cons = early_dbgp_console;
^ ~~~~~~~~~~~~~~~~~~
&
1 error generated.

vim +1062 drivers/usb/early/ehci-dbgp.c

  1046	
  1047	static int __init kgdbdbgp_parse_config(char *str)
  1048	{
  1049		char *ptr;
  1050	
  1051		if (!ehci_debug) {
  1052			if (early_dbgp_init(str))
  1053				return -1;
  1054		}
  1055		ptr = strchr(str, ',');
  1056		if (ptr) {
  1057			ptr++;
  1058			kgdbdbgp_wait_time = simple_strtoul(ptr, &ptr, 10);
  1059		}
  1060		kgdb_register_io_module(&kgdbdbgp_io_ops);
  1061		if (early_dbgp_console.index != -1)
> 1062			kgdbdbgp_io_ops.cons = early_dbgp_console;
  1063	
  1064		return 0;
  1065	}
  1066	early_param("kgdbdbgp", kgdbdbgp_parse_config);
  1067	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
