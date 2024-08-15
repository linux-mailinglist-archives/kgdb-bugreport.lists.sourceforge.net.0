Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4EB953B1D
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 15 Aug 2024 21:52:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1segWZ-0005jR-W6
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 15 Aug 2024 19:52:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1segWU-0005jG-Kr
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Aug 2024 19:52:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=28rq5maxDZqB8jsP32xdBoFfrLk+MB52KhEVGbh5AzE=; b=jjw4WaVFWs+efbQtcfspDVWTkL
 mxmLXo7BOqgOfNi5G78ZWs2qSFh8Py0u2G9j4PTUKKIaWfeVBH1AbmRDPkliQ03Bv/Xu0hb9nkZ/D
 MybkoD0demeWMtQQB6K+VhURM9KpESHHg0XmyUg+j6+DAdlBkBS+prCzJlNu0nCw4ar0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=28rq5maxDZqB8jsP32xdBoFfrLk+MB52KhEVGbh5AzE=; b=NKiUES6pXpvSGNQcO5uIdpLdQ+
 G++6zUPgKQs3LU+tReN3uwM3ueFQgs6FXgsBgkRl3lYas+jOCPBRR+eQPALNdoz8VRcn+5Yy4udHf
 MbBzzpgii28ox13F6tpYR+KgywPHXHPzvZR4w9ew4A5ouRHAcsSHJ3AFpiGNrOc/V3Bg=;
Received: from mgamail.intel.com ([198.175.65.16])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1segWT-0005Jc-E5 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Aug 2024 19:52:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723751558; x=1755287558;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oB8oS4I1iHl/GL4cZe1LnM+cRl57HEZiPtXITi4pllg=;
 b=jdvj6ICeWMeDFX56afS8Ku0pf6RNqnFyhLIkyCQMEmEfGhH7W7N5tcoR
 OhRPB0SlAJVreH5r4RSHcMmIKBCiVUMe6XswUgPR7Zo2OHsYzfTY5+Irl
 hbr6QTJ8gOhCli6R3KHg15z41+drZs2Srbu9pCpXZemCeUb1Mj/iMb4t5
 f1otXoMBcFivdHr8dJrKW6wA18zT1iakRm+iITzIP5HDZ4vKfOPokK0IL
 pRgzUXT3+he44y8VjzdMYPqXP4a2w1ORZSsCaMUefgjQw2t+y97cTFOr+
 njd9tHlW1J6njbH2LaAz5kv7z4HICBw9XXqRx9I/YyQiVl9Ah8VFKzQvY g==;
X-CSE-ConnectionGUID: oMNdA0+3Sx6yUJIybExG9Q==
X-CSE-MsgGUID: oD1JjcEkQGi5q86l/QiLBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22177419"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="22177419"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 12:52:27 -0700
X-CSE-ConnectionGUID: c3lwwQsdQfyiYoQnBD+ijg==
X-CSE-MsgGUID: wd8N1tU7SCmMi0JQbyflgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="59476885"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 15 Aug 2024 12:52:21 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1segWB-0005Y6-08;
 Thu, 15 Aug 2024 19:52:19 +0000
Date: Fri, 16 Aug 2024 03:51:27 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Rommel <mail@florommel.de>, Thomas Gleixner <tglx@linutronix.de>,
 Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <202408160303.FvgjFUth-lkp@intel.com>
References: <20240814085141.171564-1-mail@florommel.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240814085141.171564-1-mail@florommel.de>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Florian, kernel test robot noticed the following build
 errors: [auto build test ERROR on tip/master] [also build test ERROR on
 tip/x86/core
 linus/master v6.11-rc3 next-20240815] [If your patch is applied to the wrong
 git tree, kindly drop us a note. And when subm [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.16 listed in sa-trusted.bondedsender.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [198.175.65.16 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1segWT-0005Jc-E5
Subject: Re: [Kgdb-bugreport] [PATCH WIP] x86/kgdb: trampolines for shadowed
 instructions
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Florian Rommel <mail@florommel.de>, "H . Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Lorena Kretzschmar <qy15sije@cip.cs.fau.de>, Borislav Petkov <bp@alien8.de>,
 oe-kbuild-all@lists.linux.dev, Randy Dunlap <rdunlap@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andrew Morton <akpm@linux-foundation.org>,
 Stefan Saecherl <stefan.saecherl@fau.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Florian,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/master]
[also build test ERROR on tip/x86/core linus/master v6.11-rc3 next-20240815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Rommel/x86-kgdb-trampolines-for-shadowed-instructions/20240814-230936
base:   tip/master
patch link:    https://lore.kernel.org/r/20240814085141.171564-1-mail%40florommel.de
patch subject: [PATCH WIP] x86/kgdb: trampolines for shadowed instructions
config: x86_64-buildonly-randconfig-004-20240815 (https://download.01.org/0day-ci/archive/20240816/202408160303.FvgjFUth-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408160303.FvgjFUth-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408160303.FvgjFUth-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `kgdb_arch_init':
>> arch/x86/kernel/kgdb.c:416: undefined reference to `execmem_alloc'


vim +416 arch/x86/kernel/kgdb.c

   410	
   411	static int kgdb_init_trampolines(void)
   412	{
   413		/* FIXME: We should reserve enough space for all breakpoints
   414		   or make the trampoline table dynamic somehow.. */
   415		/* FIXME: Currently borrowing EXECMEM_KPROBES */
 > 416		kgdb_trampoline_page = execmem_alloc(EXECMEM_KPROBES, PAGE_SIZE);
   417		if (!kgdb_trampoline_page)
   418			return 1;
   419		memset(kgdb_trampoline_page, INT3_INSN_OPCODE, PAGE_SIZE);
   420		set_memory_rox((unsigned long)kgdb_trampoline_page, 1);
   421		kgdb_trampoline_page_curr_slot = kgdb_trampoline_page;
   422		return 0;
   423	}
   424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
