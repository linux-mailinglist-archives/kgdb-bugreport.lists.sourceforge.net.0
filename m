Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1205B02F03
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 13 Jul 2025 09:05:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JoCjnnNUy68K25TVLgcTVAVuBMt6wZU3b8ueTbwNldY=; b=HLyLYjF6ZWEMU/zEWI0ptoBw9d
	2Mns7JpwYbhSgRyt/NiiiewCCNCSXZTBmEjhUpj2B9denEFsy8MggrCRTQZ8PgL2VSG75Wqf1+voI
	HDx9of67kjrF2qE4KB2KOrwAfGmzLPN9liFIk4IzkkmnOTMyh3gJ6ndf3mXwTMR1u5o4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uaqm7-0000gY-Tr
	for lists+kgdb-bugreport@lfdr.de;
	Sun, 13 Jul 2025 07:05:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1uaqm6-0000gQ-35
 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 13 Jul 2025 07:05:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3GJMZnRpCFC2bPo8UWO8bP5gvbfgOBfqV8PBr/WIh20=; b=cffc7jJcp6TgDE5z0W+BoowHp6
 4VfPOVs4rsJ+DPiED/kSsf9qsYP6yDZbGKqhuPssJfxJfKhSTK0vgKW4Uk0riz60s+oPONjTsWNxF
 mP+vI9dzDGUvPBV3B87jmGJYwn1iEKKsEGe1G4mfAmoIzq0KDoJ17KXjBxT5jTA35CBo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3GJMZnRpCFC2bPo8UWO8bP5gvbfgOBfqV8PBr/WIh20=; b=ENpeZJap45OwX7+yYZhn9JrOpb
 2KQeU31pBxnoiRXwffwUTssG5KC7GxfcWW090IsdVzpJxch6mHBeYHZeGDw7FXJu2BbDIBBLGGDwE
 RMGsB4NqQuPRCfit+3mGt6WZvLSSWWIfjO2H6XZySdW1z9qg5voUeF79YHAu382c8Jbw=;
Received: from [198.175.65.16] (helo=mgamail.intel.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uaqm5-0001wx-8E for kgdb-bugreport@lists.sourceforge.net;
 Sun, 13 Jul 2025 07:05:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752390325; x=1783926325;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RArTnJrt8VJQG3QSG45MaPNRWBWIjFC9FCCPu+ERj00=;
 b=Ac7dbPL9KPsxvDfoWxeMlpQQ5qr77rwZBItubFO7UW8iyPWGKX0xQOXY
 lxktRj/273Nywnhf+tdoI47OXcUAbhhYd7DzJgm3E2MGIzPcWXYVBXdOH
 PDAQN7l3x14UOdUfsB569eLejPNfANSyugptd2UwvAoUZ2z8cCFcDeY7e
 1+hlADyIvj+wQqP4KnCzAZr7oFh7Jp0//HqWPuKegPw1dIGjvhQQFYp8F
 AuQrn8Bvug8RF5YlaKltnSqJdkIe5465t0m8hGzP47fcUfM7AfSrR34cB
 ShqM9fjIX+TQLrHJ4JomrlxhbWt0FcbXb3X9yJaT7jXA0hyFoihlAuzHa w==;
X-CSE-ConnectionGUID: 6V464yyjQM6uANi9KICQ/A==
X-CSE-MsgGUID: i2IIhH6CTZ+05g1Y2W5eoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54751995"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; d="scan'208";a="54751995"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 00:05:15 -0700
X-CSE-ConnectionGUID: 9PqlDzgJTIyYHfwDA6bkWg==
X-CSE-MsgGUID: ZrtAll11TdCOw4h+icgJ5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; d="scan'208";a="180368227"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 13 Jul 2025 00:05:11 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uaqlp-0007xP-0p;
 Sun, 13 Jul 2025 07:05:09 +0000
Date: Sun, 13 Jul 2025 15:04:33 +0800
From: kernel test robot <lkp@intel.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>
Message-ID: <202507131412.Lfp8uefP-lkp@intel.com>
References: <20250713-nbcon-kgdboc-v1-1-51eccd9247a8@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250713-nbcon-kgdboc-v1-1-51eccd9247a8@suse.com>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Marcos,
 kernel test robot noticed the following build errors:
 [auto build test ERROR on d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af] 
 Content analysis details:   (1.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [198.175.65.16 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uaqm5-0001wx-8E
Subject: Re: [Kgdb-bugreport] [PATCH 1/2] printk: nbcon: Export
 console_is_usage and other nbcon symbols
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

[auto build test ERROR on d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcos-Paulo-de-Souza/printk-nbcon-Export-console_is_usage-and-other-nbcon-symbols/20250713-131106
base:   d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
patch link:    https://lore.kernel.org/r/20250713-nbcon-kgdboc-v1-1-51eccd9247a8%40suse.com
patch subject: [PATCH 1/2] printk: nbcon: Export console_is_usage and other nbcon symbols
config: i386-buildonly-randconfig-004-20250713 (https://download.01.org/0day-ci/archive/20250713/202507131412.Lfp8uefP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507131412.Lfp8uefP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507131412.Lfp8uefP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/panic.c:32:
   include/linux/console.h: In function 'nbcon_context_try_acquire':
>> include/linux/console.h:653:53: warning: no return statement in function returning non-void [-Wreturn-type]
     653 | static inline bool nbcon_context_try_acquire(struct nbcon_context *ctxt) { }
         |                                                     ^~~~~~~~~~~~~
--
   In file included from kernel/printk/printk.c:26:
   include/linux/console.h: In function 'nbcon_context_try_acquire':
>> include/linux/console.h:653:53: warning: no return statement in function returning non-void [-Wreturn-type]
     653 | static inline bool nbcon_context_try_acquire(struct nbcon_context *ctxt) { }
         |                                                     ^~~~~~~~~~~~~
   In file included from kernel/printk/printk.c:62:
   kernel/printk/internal.h: At top level:
>> kernel/printk/internal.h:165:20: error: redefinition of 'console_is_usable'
     165 | static inline bool console_is_usable(struct console *con, short flags,
         |                    ^~~~~~~~~~~~~~~~~
   include/linux/console.h:661:20: note: previous definition of 'console_is_usable' with type 'bool(struct console *, short int,  bool)' {aka '_Bool(struct console *, short int,  _Bool)'}
     661 | static inline bool console_is_usable(struct console *con, short flags,
         |                    ^~~~~~~~~~~~~~~~~


vim +/console_is_usable +165 kernel/printk/internal.h

6b93bb41f6eaa1 Thomas Gleixner 2023-09-16  164  
6cb58cfebb2932 John Ogness     2024-09-04 @165  static inline bool console_is_usable(struct console *con, short flags,
6cb58cfebb2932 John Ogness     2024-09-04  166  				     bool use_atomic) { return false; }
864c25c83d834b John Ogness     2024-08-20  167  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
