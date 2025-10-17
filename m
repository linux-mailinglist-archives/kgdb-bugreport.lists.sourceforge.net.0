Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCE2BE6E9E
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 17 Oct 2025 09:20:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcW/Yvj0WSnGktwpQ8SDoajuC1zLfNu12C8VVB9NZ+I=; b=iXXi1t3kkS+QURJkUcMRDW7ziw
	taTZpAUTbzv0Hd1LVUxpGqjw7/zYBVg3jPavzlbjcoJUAzDYpczkSxf3rVxQ0SWTuuSHyllCYUDkE
	hdFAa6O6NJljpptGNXQyetIOZZF5vGcMjk7qRdZTQNCytTqzfc0hSEXus2FJMXvGUZoA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1v9elf-0004zx-Nv
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 17 Oct 2025 07:20:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1v9eld-0004zp-GG
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 17 Oct 2025 07:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z3yt9UWtd4dqYpAwtbXVIHRrE9WW3o/Ebo81kMDR0uA=; b=iLS2KnYqPy5Ve1+1kbbw7W8oqy
 iCmn4qusinzAjC5hz6pDH/Jvhwf1d2IxNptEljv3sVrNQXtaW7xZjGWyqAeFKq/sdFH0SMYqwBt/g
 yTDY6Ka5WEkQFS1xsCJTE1B6829ZcMZrfTcjyzJwDAALntAd9W05BgzVQL/jCj9UoXKk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z3yt9UWtd4dqYpAwtbXVIHRrE9WW3o/Ebo81kMDR0uA=; b=KGJaDj5/5yH2wyVJYAqEjbMHQ5
 OQ/+vR9c2ge7B/mWr/H5t0wGEbqU6QkXE6QaSuzhffzS9GENdyM+NwhGHIJvkZXkx0x7Hy0m6QQ/n
 P1p5hFLbEEfEaRQLgrF3j3WZ2QDiaxZBmfcIDJmAWdwzOaM71Ifm9O+XdaqTKgU1C54k=;
Received: from mgamail.intel.com ([192.198.163.12])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v9elc-0002EN-To for kgdb-bugreport@lists.sourceforge.net;
 Fri, 17 Oct 2025 07:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760685649; x=1792221649;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+Q70WKO2l7or27Kg3QqpFB4NgM3dvZpGl7hkoR13fiI=;
 b=BAANQvzXlKfVd8IiLeitcfU8ERirZMXgpAGITKgRLWbuTNWPHCxcG57g
 W7bgnhHYBb5JD0X+6wHk9iR6aClwVw+Tdog7xpLzMu1eMgiAQrh+987uo
 xxa/j+sO+SIorSc3JDYocBh/RiU5FkY69spjP8P/Xpy0owh32pfVjcm6v
 ZJPOLnBE8hMjMmqJN5JnCRO/Vma6jW9bghxJl7e7fFNT/rABHHsTU7KsO
 BZrCZKfBywrTt7OUvbnf+b4okQeJB4eJKNQnIST+9I3EOd8emRGOwJ2FT
 2A3WD4C302paI+jSr0ZZIEIlEyZ/LNLSdR7QFrkdnyjy/JcA3Z0e/EtPi A==;
X-CSE-ConnectionGUID: 9dT09Ck9Qn2whV7jxGNVaw==
X-CSE-MsgGUID: vxkyPJkMQy6JWEjx83+njw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66757540"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66757540"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 00:20:38 -0700
X-CSE-ConnectionGUID: WabAx5iESUmWJ2UVrKbjpw==
X-CSE-MsgGUID: 6XsIiTXiSiyeKVbjYiCj1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="187947824"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by fmviesa004.fm.intel.com with ESMTP; 17 Oct 2025 00:20:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v9el4-0005g3-0l;
 Fri, 17 Oct 2025 07:20:14 +0000
Date: Fri, 17 Oct 2025 15:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>
Message-ID: <202510171450.G2KdvDMm-lkp@intel.com>
References: <20251016-nbcon-kgdboc-v6-5-866aac60a80e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251016-nbcon-kgdboc-v6-5-866aac60a80e@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v9elc-0002EN-To
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Marcos Paulo de Souza <mpdesouza@suse.com>, linux-kernel@vger.kernel.org,
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
config: sh-randconfig-002-20251017 (https://download.01.org/0day-ci/archive/20251017/202510171450.G2KdvDMm-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171450.G2KdvDMm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171450.G2KdvDMm-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/debug/kdb/kdb_io.c: In function 'kdb_msg_write':
>> kernel/debug/kdb/kdb_io.c:612:43: error: passing argument 1 of 'nbcon_kdb_release' from incompatible pointer type [-Wincompatible-pointer-types]
     612 |                         nbcon_kdb_release(&wctxt);
         |                                           ^~~~~~
         |                                           |
         |                                           struct nbcon_write_context *
   In file included from kernel/debug/kdb/kdb_io.c:17:
   include/linux/console.h:667:54: note: expected 'struct console *' but argument is of type 'struct nbcon_write_context *'
     667 | static inline void nbcon_kdb_release(struct console *con) { }
         |                                      ~~~~~~~~~~~~~~~~^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +/nbcon_kdb_release +612 kernel/debug/kdb/kdb_io.c

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
