Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 290D7BE6179
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 17 Oct 2025 04:18:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PE8hoD0cWJwxGiMw5pcALFsRlwAbff6sordtyofOB3Y=; b=ZXgeX3KaoUlw4CJMlX3/Pzb4oF
	ISrOJ+rBCgigeqnXkmH5D198mQdQR3JavvHQuPbGSvVd5wrEVngOVE+v8Moek080kJPlgP7AJnmBC
	Kh9S6gZaFY2UFw5ud8EMbhN3LR3QFNBCJAaeete4mV21V30uwKPGqzy8sei7GjPUwY3Y=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1v9a2d-0000aR-3Z
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 17 Oct 2025 02:18:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1v9a2b-0000aL-Op
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 17 Oct 2025 02:18:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EiXfsRjuj4xAImdjxzwqR2Q9sIG7WEb/aTbmnm7CCeA=; b=bDOeCckt9XlAWKAOdhF8tuVMKd
 5kIbvfsGuFPcNAk5369DZz6IBEWGCioeq8Dvthkl6gfSOPYPjWuBifP0GC482SQmQdIwAUmXUM+te
 Jvl0PLRHgxcdDdpQOHoGTB5gqs+73VwATMdcude/eAwhBc36QcE7Ptam0nyWZLh4J5aM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EiXfsRjuj4xAImdjxzwqR2Q9sIG7WEb/aTbmnm7CCeA=; b=E8qnPF4AxJZJLe3GueZJeC4PPX
 mBvaZ+SPRoJvhk5sqzNpulHPU+TR2wbJyGDUYW0scw8ZumsK9/WSytUTncOcSGBhki32TbU+Ia3cF
 VVCWFarBCd9CsWxSiLMXmOrvGVCcwA37m1JJn8MJ4XeLVcif1V4gxHApvwmtnqTVlVYA=;
Received: from mgamail.intel.com ([198.175.65.16])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v9a2b-0004aC-U2 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 17 Oct 2025 02:18:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760667482; x=1792203482;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/Un8LzctEQSHO9DJEZfkZItIz+oWX/DCtNE4h4VMKzc=;
 b=cAmFz4GHqvSfsb5hkWxqBetauifmP1YZAHWJPkgOGVvJt4/IZ2+iOv7k
 vyKgyvFos3WgjODSJcal3JMAnnoDikGzOyQG1h4ZMiMKdOPN965xxpyXl
 fHHQYfCyg0NlQXHkqkHHCtG4d2SgyFkjGK7/iYlI5NBoLzXXCmOJ+uydP
 8e2nALFge+k35lMAaKZ720Ca4zguGFDTzCV5Oka0j6VPSMbJZhYp72SGs
 TmuAjawby4SilwRhSI3liPxYlUliQqj5kDlHMDu3aa49fkKpnqtZ/WIJH
 tuYVR8fEVjuc58Zc/cEbMdmtIXFfYFK/douqRdxUDAZFQko4kzMJnC+4G w==;
X-CSE-ConnectionGUID: AV1q9QAGQzmEiDwsxywLJw==
X-CSE-MsgGUID: YPcwbAqfQ5uqQFdWWJCtng==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="63020178"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="63020178"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:17:56 -0700
X-CSE-ConnectionGUID: POrmFGVhRTOOw0UCY3eV/g==
X-CSE-MsgGUID: B05CBBuHS1uXaiyX4dUmtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182549461"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by fmviesa006.fm.intel.com with ESMTP; 16 Oct 2025 19:17:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v9a2Q-0005Rv-2a;
 Fri, 17 Oct 2025 02:17:50 +0000
Date: Fri, 17 Oct 2025 10:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>
Message-ID: <202510171023.YREXxhMK-lkp@intel.com>
References: <20251016-nbcon-kgdboc-v6-5-866aac60a80e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251016-nbcon-kgdboc-v6-5-866aac60a80e@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Marcos,
 kernel test robot noticed the following build errors:
 [auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v9a2b-0004aC-U2
Subject: Re: [Kgdb-bugreport] [PATCH v6 5/5] kdb: Adapt kdb_msg_write to
 work with NBCON consoles
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
Cc: kgdb-bugreport@lists.sourceforge.net, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>,
 oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Marcos,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcos-Paulo-de-Souza/printk-nbcon-Export-console_is_usable/20251016-225503
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251016-nbcon-kgdboc-v6-5-866aac60a80e%40suse.com
patch subject: [PATCH v6 5/5] kdb: Adapt kdb_msg_write to work with NBCON consoles
config: i386-buildonly-randconfig-006-20251017 (https://download.01.org/0day-ci/archive/20251017/202510171023.YREXxhMK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171023.YREXxhMK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171023.YREXxhMK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/debug/kdb/kdb_io.c:612:22: error: incompatible pointer types passing 'struct nbcon_write_context *' to parameter of type 'struct console *' [-Werror,-Wincompatible-pointer-types]
     612 |                         nbcon_kdb_release(&wctxt);
         |                                           ^~~~~~
   include/linux/console.h:667:54: note: passing argument to parameter 'con' here
     667 | static inline void nbcon_kdb_release(struct console *con) { }
         |                                                      ^
   1 error generated.


vim +612 kernel/debug/kdb/kdb_io.c

   560	
   561	static void kdb_msg_write(const char *msg, int msg_len)
   562	{
   563		struct console *c;
   564		const char *cp;
   565		int cookie;
   566		int len;
   567	
   568		if (msg_len == 0)
   569			return;
   570	
   571		cp = msg;
   572		len = msg_len;
   573	
   574		while (len--) {
   575			dbg_io_ops->write_char(*cp);
   576			cp++;
   577		}
   578	
   579		/*
   580		 * The console_srcu_read_lock() only provides safe console list
   581		 * traversal. The use of the ->write() callback relies on all other
   582		 * CPUs being stopped at the moment and console drivers being able to
   583		 * handle reentrance when @oops_in_progress is set.
   584		 *
   585		 * There is no guarantee that every console driver can handle
   586		 * reentrance in this way; the developer deploying the debugger
   587		 * is responsible for ensuring that the console drivers they
   588		 * have selected handle reentrance appropriately.
   589		 */
   590		cookie = console_srcu_read_lock();
   591		for_each_console_srcu(c) {
   592			short flags = console_srcu_read_flags(c);
   593	
   594			if (!console_is_usable(c, flags, true))
   595				continue;
   596			if (c == dbg_io_ops->cons)
   597				continue;
   598	
   599			if (flags & CON_NBCON) {
   600				struct nbcon_write_context wctxt = { };
   601	
   602				/*
   603				 * Do not continue if the console is NBCON and the context
   604				 * can't be acquired.
   605				 */
   606				if (!nbcon_kdb_try_acquire(c, &wctxt))
   607					continue;
   608	
   609				nbcon_write_context_set_buf(&wctxt, (char *)msg, msg_len);
   610	
   611				c->write_atomic(c, &wctxt);
 > 612				nbcon_kdb_release(&wctxt);
   613			} else {
   614				/*
   615				 * Set oops_in_progress to encourage the console drivers to
   616				 * disregard their internal spin locks: in the current calling
   617				 * context the risk of deadlock is a bigger problem than risks
   618				 * due to re-entering the console driver. We operate directly on
   619				 * oops_in_progress rather than using bust_spinlocks() because
   620				 * the calls bust_spinlocks() makes on exit are not appropriate
   621				 * for this calling context.
   622				 */
   623				++oops_in_progress;
   624				c->write(c, msg, msg_len);
   625				--oops_in_progress;
   626			}
   627			touch_nmi_watchdog();
   628		}
   629		console_srcu_read_unlock(cookie);
   630	}
   631	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
