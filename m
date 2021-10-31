Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCA5440CB1
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 31 Oct 2021 05:00:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mh21J-000834-FW
	for lists+kgdb-bugreport@lfdr.de; Sun, 31 Oct 2021 04:00:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <lkp@intel.com>) id 1mh21C-00082x-Tl
 for kgdb-bugreport@lists.sourceforge.net; Sun, 31 Oct 2021 04:00:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F2kvLOWyYIjwtVQGYNyTOtHtScyBzgqEfqvUCpSjxak=; b=QymB+7rzVrdn2wxeXu1td66P1K
 FMQ+EiDd01RkjsLlEazjg56SwsAdWxUezhQClY1Z5ZXss0UxL4f7NMcj5A9N6kQZvw6uQ7cEl4seu
 nAnKY3ofBHU7ODQE64FlqwswjvJCaOJRPUxQaRtHYbmBxDrGlXl3iwXp9GlgatlO6dtI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F2kvLOWyYIjwtVQGYNyTOtHtScyBzgqEfqvUCpSjxak=; b=Irq3v7QB8feHy51BR94WHJH/2M
 xiGvHnJ54ICRUELqD/L+qscj97rSogO2W7NL0wCtHloVAOgu+tVaz835Z20K3rHg9bsoD5phDvfK+
 p8Whc3PtQUEL4FcCjnbGQLxNl3vJZt9idTgTh+SzzJHvi+RKdIEujSy5mGAf4pmqBioQ=;
Received: from mga01.intel.com ([192.55.52.88])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mh20s-008Eg6-Fs
 for kgdb-bugreport@lists.sourceforge.net; Sun, 31 Oct 2021 04:00:26 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10153"; a="254451994"
X-IronPort-AV: E=Sophos;i="5.87,196,1631602800"; 
 d="gz'50?scan'50,208,50";a="254451994"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2021 20:50:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,196,1631602800"; 
 d="gz'50?scan'50,208,50";a="530800327"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 30 Oct 2021 20:50:04 -0700
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mh1rA-00024M-1u; Sun, 31 Oct 2021 03:50:04 +0000
Date: Sun, 31 Oct 2021 11:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Thompson <daniel.thompson@linaro.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Message-ID: <202110311152.CDlq4mU8-lkp@intel.com>
References: <20211029171935.2926228-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211029171935.2926228-1-daniel.thompson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Daniel, I love your patch! Perhaps something to improve:
 [auto build test WARNING on 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f] 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: 01.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [192.55.52.88 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [192.55.52.88 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1mh20s-008Eg6-Fs
Content-Disposition: inline
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Adopt scheduler's task
 clasification
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
Cc: Xiang wangx <wangxiang@cdjrlc.com>, kbuild-all@lists.01.org,
 jing yangyang <jing.yangyang@zte.com.cn>, kgdb-bugreport@lists.sourceforge.net,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, patches@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f]

url:    https://github.com/0day-ci/linux/commits/Daniel-Thompson/kdb-Adopt-scheduler-s-task-clasification/20211030-012127
base:   6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f
config: riscv-randconfig-r042-20211031 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 82ed106567063ea269c6d5669278b733e173a42f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/9f7ea8ffacb27d8b7fe10190fa91e2803c985611
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Thompson/kdb-Adopt-scheduler-s-task-clasification/20211030-012127
        git checkout 9f7ea8ffacb27d8b7fe10190fa91e2803c985611
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=riscv 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from kernel/debug/kdb/kdb_support.c:21:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:36:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from kernel/debug/kdb/kdb_support.c:21:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/debug/kdb/kdb_support.c:21:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> kernel/debug/kdb/kdb_support.c:501:41: warning: variable 'cpu' is uninitialized when used here [-Wuninitialized]
                   if (!kdb_task_has_cpu(p) || kgdb_info[cpu].irq_depth == 1) {
                                                         ^~~
   kernel/debug/kdb/kdb_support.c:490:9: note: initialize the variable 'cpu' to silence this warning
           int cpu;
                  ^
                   = 0
   8 warnings generated.


vim +/cpu +501 kernel/debug/kdb/kdb_support.c

5d5314d6795f3c Jason Wessel      2010-05-20  476  
5d5314d6795f3c Jason Wessel      2010-05-20  477  
5d5314d6795f3c Jason Wessel      2010-05-20  478  
5d5314d6795f3c Jason Wessel      2010-05-20  479  /*
5d5314d6795f3c Jason Wessel      2010-05-20  480   * kdb_task_state_char - Return the character that represents the task state.
5d5314d6795f3c Jason Wessel      2010-05-20  481   * Inputs:
5d5314d6795f3c Jason Wessel      2010-05-20  482   *	p	struct task for the process
5d5314d6795f3c Jason Wessel      2010-05-20  483   * Returns:
5d5314d6795f3c Jason Wessel      2010-05-20  484   *	One character to represent the task state.
5d5314d6795f3c Jason Wessel      2010-05-20  485   */
5d5314d6795f3c Jason Wessel      2010-05-20  486  char kdb_task_state_char (const struct task_struct *p)
5d5314d6795f3c Jason Wessel      2010-05-20  487  {
5d5314d6795f3c Jason Wessel      2010-05-20  488  	unsigned long tmp;
2f064a59a11ff9 Peter Zijlstra    2021-06-11  489  	char state;
2f064a59a11ff9 Peter Zijlstra    2021-06-11  490  	int cpu;
5d5314d6795f3c Jason Wessel      2010-05-20  491  
fe557319aa06c2 Christoph Hellwig 2020-06-17  492  	if (!p ||
fe557319aa06c2 Christoph Hellwig 2020-06-17  493  	    copy_from_kernel_nofault(&tmp, (char *)p, sizeof(unsigned long)))
5d5314d6795f3c Jason Wessel      2010-05-20  494  		return 'E';
5d5314d6795f3c Jason Wessel      2010-05-20  495  
9f7ea8ffacb27d Daniel Thompson   2021-10-29  496  	state = task_state_to_char((struct task_struct *) p);
9f7ea8ffacb27d Daniel Thompson   2021-10-29  497  
7fc20c5cbdd184 Paul E. McKenney  2011-11-10  498  	if (is_idle_task(p)) {
5d5314d6795f3c Jason Wessel      2010-05-20  499  		/* Idle task.  Is it really idle, apart from the kdb
5d5314d6795f3c Jason Wessel      2010-05-20  500  		 * interrupt? */
5d5314d6795f3c Jason Wessel      2010-05-20 @501  		if (!kdb_task_has_cpu(p) || kgdb_info[cpu].irq_depth == 1) {
5d5314d6795f3c Jason Wessel      2010-05-20  502  			if (cpu != kdb_initial_cpu)
9f7ea8ffacb27d Daniel Thompson   2021-10-29  503  				state = '-';	/* idle task */
5d5314d6795f3c Jason Wessel      2010-05-20  504  		}
9f7ea8ffacb27d Daniel Thompson   2021-10-29  505  	} else if (!p->mm && strchr("IMS", state)) {
9f7ea8ffacb27d Daniel Thompson   2021-10-29  506  		state = tolower(state);		/* sleeping system daemon */
5d5314d6795f3c Jason Wessel      2010-05-20  507  	}
5d5314d6795f3c Jason Wessel      2010-05-20  508  	return state;
5d5314d6795f3c Jason Wessel      2010-05-20  509  }
5d5314d6795f3c Jason Wessel      2010-05-20  510  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
