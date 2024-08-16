Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEFD9547AD
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 16 Aug 2024 13:13:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1seutS-0004EB-5p
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 16 Aug 2024 11:13:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1seutJ-0004Du-9N
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 16 Aug 2024 11:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7RzeMvFH2OSyqmXgDjed+yV2EHtpP1XH5hp46r9sFl8=; b=DVWNENYp7SFKl7HE9jvaCN1eet
 rqOvoyVCcFn4pfEpHYpDDW+Mw2RJCXhHIsJSmmqHOVOGNZ4lyV/4ailfUIZY2wfeW3CTMkD4NuXn4
 ldhCheGX7G4QEpmxndhdF6u8tPBZ4/VEFfs4FrabReKbJSKnQ6Y37mBrnj74ej4QDyNk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7RzeMvFH2OSyqmXgDjed+yV2EHtpP1XH5hp46r9sFl8=; b=hSTD+VLVCH9E8yhK0LIU24iM9E
 5B/PHjg3HiKBBsKolj+TydDz5CH5PDP5BW761ZFTl43FKGfSEGx2UC8b5s6ftOymt1faufQ5TDfKZ
 oB+LWQaDfwidRoM+cERobZ64As7UR7pXRMz6icOmrv0CSj6+dPLPRzOy6PSBuxxjebjE=;
Received: from mgamail.intel.com ([198.175.65.21])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1seutH-0008M6-5S for kgdb-bugreport@lists.sourceforge.net;
 Fri, 16 Aug 2024 11:13:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723806787; x=1755342787;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=D3wfA7SQItWr4+Uh0GYXu1SzL5q3oh6L5Pk0a4zzf5c=;
 b=UWQL/Am5t+NbIy6Y3bQTqdJALapympsbiZuzXlQz1AgFwGoyAQchCnPz
 9kqnBCUEaspeECKWWH+iQtoQLM70uXQw4jhra9lmgb2cJcrmsFWc1gZX1
 BvJSPoUVFjgN0S2Sj528z1djrwEs19sXdsJ9Gci609w+CYPa1dG0Fjb6s
 vqqB+az9hpdCPLI03EJwrJcJAEbgyhZTWHSWQNZxIAQw5xPMNsW7k9H+G
 9+ai+4Ck23ROwjcUW5//gA1lBSQ6WoKBkRrAmYjTIvcNFsVyPlCcnegsT
 3WL1WStEE0NFE+VmwgEuzBRSrpXMKZ/33euh8hW3FBtdBazg+wbFHhoZL g==;
X-CSE-ConnectionGUID: hrRVi8bLTsaWG6qnUBTPQg==
X-CSE-MsgGUID: 6yRDU15PRb6zkY4uEFOk+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22068955"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="22068955"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 04:12:56 -0700
X-CSE-ConnectionGUID: te6maNNRTm+v0c2KtFzTvg==
X-CSE-MsgGUID: vIs1qiDeT3a7SKyZKdlbxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="90420797"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 16 Aug 2024 04:12:50 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1seusy-0006Lu-32;
 Fri, 16 Aug 2024 11:12:48 +0000
Date: Fri, 16 Aug 2024 19:12:09 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Rommel <mail@florommel.de>, Thomas Gleixner <tglx@linutronix.de>,
 Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <202408162013.3Nz53QCv-lkp@intel.com>
References: <20240814085141.171564-1-mail@florommel.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240814085141.171564-1-mail@florommel.de>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Florian, kernel test robot noticed the following build
 errors: [auto build test ERROR on tip/master] [also build test ERROR on
 tip/x86/core
 linus/master v6.11-rc3 next-20240816] [If your patch is applied to the wrong
 git tree, kindly drop us a note. And when subm [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.175.65.21 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.21 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.21 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1seutH-0008M6-5S
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
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Florian Rommel <mail@florommel.de>, "H . Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
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
[also build test ERROR on tip/x86/core linus/master v6.11-rc3 next-20240816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Rommel/x86-kgdb-trampolines-for-shadowed-instructions/20240814-230936
base:   tip/master
patch link:    https://lore.kernel.org/r/20240814085141.171564-1-mail%40florommel.de
patch subject: [PATCH WIP] x86/kgdb: trampolines for shadowed instructions
config: x86_64-buildonly-randconfig-004-20240816 (https://download.01.org/0day-ci/archive/20240816/202408162013.3Nz53QCv-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408162013.3Nz53QCv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408162013.3Nz53QCv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: execmem_alloc
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(kgdb_arch_init)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
