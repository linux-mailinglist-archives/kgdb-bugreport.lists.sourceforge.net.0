Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B7C497F83
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 24 Jan 2022 13:27:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nByRu-0001Bq-OM
	for lists+kgdb-bugreport@lfdr.de; Mon, 24 Jan 2022 12:27:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <lkp@intel.com>) id 1nByRs-0001BT-S9
 for kgdb-bugreport@lists.sourceforge.net; Mon, 24 Jan 2022 12:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SllEqYwsBjTcUMom+7/SwLXQD8LKrvJya2izOQyQj+E=; b=N1McnuRltrom14wh+9Xa62KuBh
 anRnH6RjNFxmNM/qo/ttfU7YYaYcu3aK7LkyeXCprRs8QXzuJbmKAqjMabUR7YNCLOYtH5r7lAtQj
 iHswa+AwSKg7c2Oh6c4jpA7yfVvcxgEI2PxjdDw0YVxPDqO4zWHAi1w/LHbefMZ+4u64=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SllEqYwsBjTcUMom+7/SwLXQD8LKrvJya2izOQyQj+E=; b=CVOKehlSl5eH8hpZksxg4kn156
 AVUpp1LQDtadjU8bnwyJqbwOmGKcL67kvRfuNiqwFhcXcZHGyd1YEroptO83Z0xl0fwVKZ/zU5RsB
 sRjV0YHG0jktixtvIpGWy2b++3SSLp4B3HVEY1rdvWUnghHqDjEAl2UppsjiFKM7mWcE=;
Received: from mga11.intel.com ([192.55.52.93])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nByRp-00AP5v-Qj
 for kgdb-bugreport@lists.sourceforge.net; Mon, 24 Jan 2022 12:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643027269; x=1674563269;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ynT/qixLnUd/rCOCLxvQhigT+gasAy3POU2QKgKgKvQ=;
 b=aAcHDW+JMG9/gO6xnleBuYTX/inFd10RcEnJpPgozRT5QzYd5F8Qr87J
 Q99FUt5jf6YHIJDW7ALbY2Y9oc6ZOACtkoGEkgIPTMyNVLuF5fol2JuAk
 2BDc8xEqj6Lp3xLvQCXefq1snQE8UDF4JPaPv3IuuULyHYTBOkOmq+EdY
 OWsmp+hHgcXIbHM5USTFQvA4nuut1EAUF+6CgemjHtTZ9uxEdN32q2TH5
 tOXpjcPRRA3gbCuLNgSdvhiOuz1g20XBwhWFNZrHt3jAeDPYYtEY+77qF
 E6y+6vBbYr02Z4Frz5hev0gNVXq1d26U/oRgSuJSSHveFmq6ZOLCKAp1F A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="243629365"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="243629365"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 04:27:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="695405990"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 24 Jan 2022 04:27:40 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nByRf-000IJC-DB; Mon, 24 Jan 2022 12:27:39 +0000
Date: Mon, 24 Jan 2022 20:27:18 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>
Message-ID: <202201242036.OjeEPlOb-lkp@intel.com>
References: <ff7a8bdc9a90a77de2ebc059beb4f644b34186c1.1643015752.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ff7a8bdc9a90a77de2ebc059beb4f644b34186c1.1643015752.git.christophe.leroy@csgroup.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Christophe,
 I love your patch! Perhaps something to improve:
 [auto build test WARNING on mcgrof/modules-next] [also build test WARNING
 on powerpc/next linus/master jeyu/modules-next v5.17-rc1 next-20220124] [If
 your patch is applied to the wrong git tree, kindl [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [192.55.52.93 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [192.55.52.93 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nByRp-00AP5v-Qj
Subject: Re: [Kgdb-bugreport] [PATCH 7/7] powerpc: Select
 ARCH_WANTS_MODULES_DATA_IN_VMALLOC on book3s/32 and 8xx
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 kbuild-all@lists.01.org,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Christophe,

I love your patch! Perhaps something to improve:

[auto build test WARNING on mcgrof/modules-next]
[also build test WARNING on powerpc/next linus/master jeyu/modules-next v5.17-rc1 next-20220124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/Allocate-module-text-and-data-separately/20220124-172517
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20220124/202201242036.OjeEPlOb-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/2a5f7a254dd5c1efcfb852f5747632c85582016d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christophe-Leroy/Allocate-module-text-and-data-separately/20220124-172517
        git checkout 2a5f7a254dd5c1efcfb852f5747632c85582016d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash kernel/debug/kdb/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/debug/kdb/kdb_main.c: In function 'kdb_lsmod':
>> kernel/debug/kdb/kdb_main.c:2027:38: warning: format '%p' expects a matching 'void *' argument [-Wformat=]
    2027 |                 kdb_printf("/%8u  0x%px ", mod->data_layout.size);
         |                                     ~^
         |                                      |
         |                                      void *


vim +2027 kernel/debug/kdb/kdb_main.c

5d5314d6795f3c1 Jason Wessel     2010-05-20  2006  
5d5314d6795f3c1 Jason Wessel     2010-05-20  2007  #if defined(CONFIG_MODULES)
5d5314d6795f3c1 Jason Wessel     2010-05-20  2008  /*
5d5314d6795f3c1 Jason Wessel     2010-05-20  2009   * kdb_lsmod - This function implements the 'lsmod' command.  Lists
5d5314d6795f3c1 Jason Wessel     2010-05-20  2010   *	currently loaded kernel modules.
5d5314d6795f3c1 Jason Wessel     2010-05-20  2011   *	Mostly taken from userland lsmod.
5d5314d6795f3c1 Jason Wessel     2010-05-20  2012   */
5d5314d6795f3c1 Jason Wessel     2010-05-20  2013  static int kdb_lsmod(int argc, const char **argv)
5d5314d6795f3c1 Jason Wessel     2010-05-20  2014  {
5d5314d6795f3c1 Jason Wessel     2010-05-20  2015  	struct module *mod;
5d5314d6795f3c1 Jason Wessel     2010-05-20  2016  
5d5314d6795f3c1 Jason Wessel     2010-05-20  2017  	if (argc != 0)
5d5314d6795f3c1 Jason Wessel     2010-05-20  2018  		return KDB_ARGCOUNT;
5d5314d6795f3c1 Jason Wessel     2010-05-20  2019  
5d5314d6795f3c1 Jason Wessel     2010-05-20  2020  	kdb_printf("Module                  Size  modstruct     Used by\n");
5d5314d6795f3c1 Jason Wessel     2010-05-20  2021  	list_for_each_entry(mod, kdb_modules, list) {
0d21b0e3477395e Rusty Russell    2013-01-12  2022  		if (mod->state == MODULE_STATE_UNFORMED)
0d21b0e3477395e Rusty Russell    2013-01-12  2023  			continue;
5d5314d6795f3c1 Jason Wessel     2010-05-20  2024  
299a20e0bead4b7 Christophe Leroy 2022-01-24  2025  		kdb_printf("%-20s%8u", mod->name, mod->core_layout.size);
299a20e0bead4b7 Christophe Leroy 2022-01-24  2026  #ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
299a20e0bead4b7 Christophe Leroy 2022-01-24 @2027  		kdb_printf("/%8u  0x%px ", mod->data_layout.size);
299a20e0bead4b7 Christophe Leroy 2022-01-24  2028  #endif
299a20e0bead4b7 Christophe Leroy 2022-01-24  2029  		kdb_printf("  0x%px ", (void *)mod);
5d5314d6795f3c1 Jason Wessel     2010-05-20  2030  #ifdef CONFIG_MODULE_UNLOAD
d5db139ab376464 Rusty Russell    2015-01-22  2031  		kdb_printf("%4d ", module_refcount(mod));
5d5314d6795f3c1 Jason Wessel     2010-05-20  2032  #endif
5d5314d6795f3c1 Jason Wessel     2010-05-20  2033  		if (mod->state == MODULE_STATE_GOING)
5d5314d6795f3c1 Jason Wessel     2010-05-20  2034  			kdb_printf(" (Unloading)");
5d5314d6795f3c1 Jason Wessel     2010-05-20  2035  		else if (mod->state == MODULE_STATE_COMING)
5d5314d6795f3c1 Jason Wessel     2010-05-20  2036  			kdb_printf(" (Loading)");
5d5314d6795f3c1 Jason Wessel     2010-05-20  2037  		else
5d5314d6795f3c1 Jason Wessel     2010-05-20  2038  			kdb_printf(" (Live)");
568fb6f42ac6851 Christophe Leroy 2018-09-27  2039  		kdb_printf(" 0x%px", mod->core_layout.base);
299a20e0bead4b7 Christophe Leroy 2022-01-24  2040  #ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
299a20e0bead4b7 Christophe Leroy 2022-01-24  2041  		kdb_printf("/0x%px", mod->data_layout.base);
299a20e0bead4b7 Christophe Leroy 2022-01-24  2042  #endif
5d5314d6795f3c1 Jason Wessel     2010-05-20  2043  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
