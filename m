Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3B52E6D5B
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 29 Dec 2020 03:42:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ku4xv-0004vm-4c
	for lists+kgdb-bugreport@lfdr.de; Tue, 29 Dec 2020 02:42:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <lkp@intel.com>) id 1ku4xp-0004v8-N2
 for kgdb-bugreport@lists.sourceforge.net; Tue, 29 Dec 2020 02:42:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0SNNNRiywsfQG29S494dhWlwf/t/RAXcyrTB40YKWas=; b=fhrisR158hbjeR8C94Kk7e5htx
 nMrxI3uk/qXcysG62WfHTUKA6cYHqcrgZTeSccSGWlVT+4pbgUq6SlaE8rwwODNoVHPP+JzpHCf5O
 nOnZ/kqQ3SASzXS4iqzC3ZUYCAWrTVaNNA8P3sApzqvxVLgdfzBdVOuzOM9+vzKzt/Ys=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0SNNNRiywsfQG29S494dhWlwf/t/RAXcyrTB40YKWas=; b=kE8mxQgQm3+wxfL4y7A4ckOKLD
 i0fp8h24G/oE3AHU0lPOAK+tD6vvegnyRKD6XXYQHEs5OFgt9+/SPy8vFeNohkeXXAJfs10H2TcXa
 C+L6LZhf+7M05I4rW9xpCsKC0tUGY26hDHjhCj/YA+oiSp3pdFXhegz7kXjs52UhhsSg=;
Received: from mga05.intel.com ([192.55.52.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ku4xl-007qIR-I7
 for kgdb-bugreport@lists.sourceforge.net; Tue, 29 Dec 2020 02:42:21 +0000
IronPort-SDR: +fN1jYnNuiF7bFZb17aVWXmcWKpChBvG0bV5lzyAmvPANwnGYN63B+/6ESoicYS9kbg6XvBROa
 kcrO2GJQszgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9848"; a="261200908"
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; 
 d="gz'50?scan'50,208,50";a="261200908"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2020 18:42:11 -0800
IronPort-SDR: 7tHuVmVY4jzhRU1hOWXb6DqSpEw3rEWB3Gig/Ypow5ix1BX/LltCnxw8UK93Ii7V7h0iuGkAti
 RZubYRoFQLTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; 
 d="gz'50?scan'50,208,50";a="347213958"
Received: from lkp-server02.sh.intel.com (HELO 4242b19f17ef) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 28 Dec 2020 18:42:09 -0800
Received: from kbuild by 4242b19f17ef with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1ku4xc-0003Gi-EM; Tue, 29 Dec 2020 02:42:08 +0000
Date: Tue, 29 Dec 2020 10:41:33 +0800
From: kernel test robot <lkp@intel.com>
To: Zheng Yongjun <zhengyongjun3@huawei.com>, jason.wessel@windriver.com,
 daniel.thompson@linaro.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Message-ID: <202012291047.WfIHp8hU-lkp@intel.com>
References: <20201222133344.19753-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201222133344.19753-1-zhengyongjun3@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1ku4xl-007qIR-I7
Content-Disposition: inline
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Kgdb-bugreport] [PATCH -next] misc: use DIV_ROUND_UP macro to
 do calculation
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
Cc: Zheng Yongjun <zhengyongjun3@huawei.com>, kbuild-all@lists.01.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Zheng,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20201222]

url:    https://github.com/0day-ci/linux/commits/Zheng-Yongjun/misc-use-DIV_ROUND_UP-macro-to-do-calculation/20201222-220138
base:    6c3eb1b174c07bcaa927003e8bc91e81ab1d5a9e
config: microblaze-randconfig-r022-20201221 (attached as .config)
compiler: microblaze-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5b74808b6866933e6adc4d6475429e77c3ccbb23
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zheng-Yongjun/misc-use-DIV_ROUND_UP-macro-to-do-calculation/20201222-220138
        git checkout 5b74808b6866933e6adc4d6475429e77c3ccbb23
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=microblaze 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/bits.h:5,
                    from include/linux/bitops.h:6,
                    from include/linux/kernel.h:11,
                    from drivers/misc/kgdbts.c:85:
>> drivers/misc/kgdbts.c:143:31: error: expected ')' before 'i'
     143 |          sizeof(unsigned long)i)];
         |                               ^
   include/uapi/linux/const.h:34:46: note: in definition of macro '__KERNEL_DIV_ROUND_UP'
      34 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                              ^
   drivers/misc/kgdbts.c:142:38: note: in expansion of macro 'DIV_ROUND_UP'
     142 | static unsigned long kgdbts_gdb_regs[DIV_ROUND_UP(NUMREGBYTES,
         |                                      ^~~~~~~~~~~~
   include/uapi/linux/const.h:34:45: note: to match this '('
      34 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                             ^
   include/linux/math.h:36:22: note: in expansion of macro '__KERNEL_DIV_ROUND_UP'
      36 | #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/misc/kgdbts.c:142:38: note: in expansion of macro 'DIV_ROUND_UP'
     142 | static unsigned long kgdbts_gdb_regs[DIV_ROUND_UP(NUMREGBYTES,
         |                                      ^~~~~~~~~~~~
>> drivers/misc/kgdbts.c:143:31: error: expected ')' before 'i'
     143 |          sizeof(unsigned long)i)];
         |                               ^
   include/uapi/linux/const.h:34:57: note: in definition of macro '__KERNEL_DIV_ROUND_UP'
      34 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                                         ^
   drivers/misc/kgdbts.c:142:38: note: in expansion of macro 'DIV_ROUND_UP'
     142 | static unsigned long kgdbts_gdb_regs[DIV_ROUND_UP(NUMREGBYTES,
         |                                      ^~~~~~~~~~~~
   include/uapi/linux/const.h:34:56: note: to match this '('
      34 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                                        ^
   include/linux/math.h:36:22: note: in expansion of macro '__KERNEL_DIV_ROUND_UP'
      36 | #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/misc/kgdbts.c:142:38: note: in expansion of macro 'DIV_ROUND_UP'
     142 | static unsigned long kgdbts_gdb_regs[DIV_ROUND_UP(NUMREGBYTES,
         |                                      ^~~~~~~~~~~~


vim +143 drivers/misc/kgdbts.c

   140	
   141	/* Storage for the registers, in GDB format. */
   142	static unsigned long kgdbts_gdb_regs[DIV_ROUND_UP(NUMREGBYTES,
 > 143					     sizeof(unsigned long)i)];
   144	static struct pt_regs kgdbts_regs;
   145	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
