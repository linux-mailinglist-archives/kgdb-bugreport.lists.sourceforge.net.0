Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E0740EE6D
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 17 Sep 2021 02:43:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mR1yI-0003vx-7y
	for lists+kgdb-bugreport@lfdr.de; Fri, 17 Sep 2021 00:43:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <lkp@intel.com>) id 1mR1yH-0003vn-8d
 for kgdb-bugreport@lists.sourceforge.net; Fri, 17 Sep 2021 00:43:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tZt/mTzz1ZkaNSGtYxBUwa4bX+2kq3Q+nGKqm+Gimes=; b=XZPSu+vDSfMpLCuNM/T8bzFcrV
 mXSbRPLcZoRQzIetK+Ot6qK/aAI3S0g5O5mwrp/g5Rz32ihOet15ugXMPTT90TmWgZp95Tqe8nyOd
 d0ZQxvfH4yxDPDsz/GKDgk0+SEDFfq7c2hrakZwcQvsDTZGz3bmRpL7ccoK5o3pB1o1s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tZt/mTzz1ZkaNSGtYxBUwa4bX+2kq3Q+nGKqm+Gimes=; b=Zb6gE7rajomU8/pCaRCA9m8aXB
 R7unVu8UnTknS2vyVBqDPdRSR60oj7xzMa6scGiOkoR1m/kjHaTsZpdaQtXpyCZqzRc1Yf/U6z63t
 1IEVY3kFdmrfykaNidWuErFG9A4fLV4gKgKIpiNbxonNUCyThImvNCwq/8tdhKsIFP1A=;
Received: from mga14.intel.com ([192.55.52.115])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mR1yD-00051C-Jl
 for kgdb-bugreport@lists.sourceforge.net; Fri, 17 Sep 2021 00:43:17 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="222352917"
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; 
 d="gz'50?scan'50,208,50";a="222352917"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 17:43:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; 
 d="gz'50?scan'50,208,50";a="509563759"
Received: from lkp-server01.sh.intel.com (HELO 285e7b116627) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 16 Sep 2021 17:43:03 -0700
Received: from kbuild by 285e7b116627 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mR1y2-0001Zt-S9; Fri, 17 Sep 2021 00:43:02 +0000
Date: Fri, 17 Sep 2021 08:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Thompson <daniel.thompson@linaro.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Message-ID: <202109170802.zMVIp0aN-lkp@intel.com>
References: <20210916154253.2731609-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210916154253.2731609-1-daniel.thompson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Daniel, I love your patch! Yet something to improve: [auto
 build test ERROR on 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f] 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [192.55.52.115 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: 01.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1mR1yD-00051C-Jl
Content-Disposition: inline
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Adopt scheduler's task
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

I love your patch! Yet something to improve:

[auto build test ERROR on 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f]

url:    https://github.com/0day-ci/linux/commits/Daniel-Thompson/kdb-Adopt-scheduler-s-task-clasification/20210917-004549
base:   6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f
config: hexagon-buildonly-randconfig-r005-20210916 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c8b3d7d6d6de37af68b2f379d0e37304f78e115f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/d315f14b7a044983f76f08221be33c2900c58e37
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Thompson/kdb-Adopt-scheduler-s-task-clasification/20210917-004549
        git checkout d315f14b7a044983f76f08221be33c2900c58e37
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=hexagon 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/debug/kdb/kdb_support.c:512:41: error: variable 'cpu' is uninitialized when used here [-Werror,-Wuninitialized]
                   if (!kdb_task_has_cpu(p) || kgdb_info[cpu].irq_depth == 1) {
                                                         ^~~
   kernel/debug/kdb/kdb_support.c:489:9: note: initialize the variable 'cpu' to silence this warning
           int cpu;
                  ^
                   = 0
   1 error generated.


vim +/cpu +512 kernel/debug/kdb/kdb_support.c

5d5314d6795f3c1 Jason Wessel      2010-05-20  475  
5d5314d6795f3c1 Jason Wessel      2010-05-20  476  
5d5314d6795f3c1 Jason Wessel      2010-05-20  477  
5d5314d6795f3c1 Jason Wessel      2010-05-20  478  /*
5d5314d6795f3c1 Jason Wessel      2010-05-20  479   * kdb_task_state_char - Return the character that represents the task state.
5d5314d6795f3c1 Jason Wessel      2010-05-20  480   * Inputs:
5d5314d6795f3c1 Jason Wessel      2010-05-20  481   *	p	struct task for the process
5d5314d6795f3c1 Jason Wessel      2010-05-20  482   * Returns:
5d5314d6795f3c1 Jason Wessel      2010-05-20  483   *	One character to represent the task state.
5d5314d6795f3c1 Jason Wessel      2010-05-20  484   */
5d5314d6795f3c1 Jason Wessel      2010-05-20  485  char kdb_task_state_char (const struct task_struct *p)
5d5314d6795f3c1 Jason Wessel      2010-05-20  486  {
5d5314d6795f3c1 Jason Wessel      2010-05-20  487  	unsigned long tmp;
2f064a59a11ff9b Peter Zijlstra    2021-06-11  488  	char state;
2f064a59a11ff9b Peter Zijlstra    2021-06-11  489  	int cpu;
5d5314d6795f3c1 Jason Wessel      2010-05-20  490  
fe557319aa06c23 Christoph Hellwig 2020-06-17  491  	if (!p ||
fe557319aa06c23 Christoph Hellwig 2020-06-17  492  	    copy_from_kernel_nofault(&tmp, (char *)p, sizeof(unsigned long)))
5d5314d6795f3c1 Jason Wessel      2010-05-20  493  		return 'E';
5d5314d6795f3c1 Jason Wessel      2010-05-20  494  
d315f14b7a04498 Daniel Thompson   2021-09-16  495  	state = task_state_to_char((struct task_struct *) p);
d315f14b7a04498 Daniel Thompson   2021-09-16  496  
d315f14b7a04498 Daniel Thompson   2021-09-16  497  	/*
d315f14b7a04498 Daniel Thompson   2021-09-16  498  	 * task_state_to_char() uses I(dle) differently to is_idle_task().
d315f14b7a04498 Daniel Thompson   2021-09-16  499  	 * I(dle) tasks are (U)ninterruptible tasks that do not
d315f14b7a04498 Daniel Thompson   2021-09-16  500  	 * contribute to the load average and have nothing to do with
d315f14b7a04498 Daniel Thompson   2021-09-16  501  	 * code that runs on idle CPUs.
d315f14b7a04498 Daniel Thompson   2021-09-16  502  	 *
d315f14b7a04498 Daniel Thompson   2021-09-16  503  	 * For historic reasons we'd like to reserve I for idle CPUs in
d315f14b7a04498 Daniel Thompson   2021-09-16  504  	 * kdb so we must reclassify (I)dle tasks.
d315f14b7a04498 Daniel Thompson   2021-09-16  505  	 */
d315f14b7a04498 Daniel Thompson   2021-09-16  506  	if (state == 'I')
d315f14b7a04498 Daniel Thompson   2021-09-16  507  		state = 'U';
d315f14b7a04498 Daniel Thompson   2021-09-16  508  
7fc20c5cbdd184f Paul E. McKenney  2011-11-10  509  	if (is_idle_task(p)) {
5d5314d6795f3c1 Jason Wessel      2010-05-20  510  		/* Idle task.  Is it really idle, apart from the kdb
5d5314d6795f3c1 Jason Wessel      2010-05-20  511  		 * interrupt? */
5d5314d6795f3c1 Jason Wessel      2010-05-20 @512  		if (!kdb_task_has_cpu(p) || kgdb_info[cpu].irq_depth == 1) {
5d5314d6795f3c1 Jason Wessel      2010-05-20  513  			if (cpu != kdb_initial_cpu)
5d5314d6795f3c1 Jason Wessel      2010-05-20  514  				state = 'I';	/* idle task */
5d5314d6795f3c1 Jason Wessel      2010-05-20  515  		}
5d5314d6795f3c1 Jason Wessel      2010-05-20  516  	} else if (!p->mm && state == 'S') {
5d5314d6795f3c1 Jason Wessel      2010-05-20  517  		state = 'M';	/* sleeping system daemon */
5d5314d6795f3c1 Jason Wessel      2010-05-20  518  	}
5d5314d6795f3c1 Jason Wessel      2010-05-20  519  	return state;
5d5314d6795f3c1 Jason Wessel      2010-05-20  520  }
5d5314d6795f3c1 Jason Wessel      2010-05-20  521  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
