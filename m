Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDA190DDE9
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 23:02:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJfyQ-00021r-L4
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 21:02:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1sJfyO-00021l-FC
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 21:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CKGf8dTvGwyp29F1vjdE4MFoT/D6u4WikPOwdO+sJKY=; b=DaDvfrO8SJ1NrMXsWTZ27pRzDB
 6TwrwtJUTcEu7q31sW68YeWHkp/GPS7Ys9Ua5CiTfE8mUuS4hzP9POMscjQKf7k7GDHj5lTZN1KAG
 YBTTD9qI/Ek4ddhPs+SkxPcBZyYIfohmNVU7k0m7qTBEaNze9lIy+OBlq97xKLyRe00E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CKGf8dTvGwyp29F1vjdE4MFoT/D6u4WikPOwdO+sJKY=; b=GqbnrqwKUGjoaFIlMH9tHLGjD7
 wv6ms+JopYaYr8D36/ASa/u1g0xRPstPmR/INQLgySkFlOujIR+5L+1CJVRllehHU8C2NyCUXRFmt
 my05i3z9x4KZiUHr/KgFZi+CFDxT9sTKqCoR4WdtXxtajqA2tei0f4IqsSAZqdoLG31k=;
Received: from mgamail.intel.com ([192.198.163.7])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sJfyN-00081Q-RY for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 21:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718744555; x=1750280555;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZtlWpZazkZMr9hjqcT0x7ELefnO6avTkg5CabtOR7jo=;
 b=KEXCJJi1yidfLyVMTMuPvPrBQ2Z0hwM3Ots6k/J2jKYagEChzPv8xbgG
 0iA/VluhfLlLnbKOZmAHZfcdwOMoIyIrgybasyoDr7UTLodIEhysxt5mj
 EaRCD3bMIwXmYLlZneRmH7vrYY3c9lmrFNEY117naylCMbgtgy/Ha+rA5
 b3No+Pl8IJvywb2lIHsIHyeU0Qc75jsCMifddULcu+qCEwKwFUKPrs+tW
 osJnN1namrWx9MD8d9vJA0CiFyD9X2M/X3OHZaRxiAo6p9HLvrQuT2OSL
 dIVTT/0AKZm+CyN8eahbe+0W4ulf5sua3JYRhevcSUV5I7wrINehjE76f Q==;
X-CSE-ConnectionGUID: Zr1iB+3xSbuexKqn7LWl9Q==
X-CSE-MsgGUID: wczMb9BXQJe6x0fgF4Tnzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="41061980"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41061980"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 14:02:24 -0700
X-CSE-ConnectionGUID: +GH3mnq+RBOf6kxw23WGQQ==
X-CSE-MsgGUID: oyGdrqUoRKKa7VmngOHzwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="42394361"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 18 Jun 2024 14:02:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sJfy7-0005uQ-0t;
 Tue, 18 Jun 2024 21:02:19 +0000
Date: Wed, 19 Jun 2024 05:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <202406190433.U3alc3Xi-lkp@intel.com>
References: <20240617173426.11.I899d035485269f5110a3323fbb1680fbba718e4c@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240617173426.11.I899d035485269f5110a3323fbb1680fbba718e4c@changeid>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Douglas, kernel test robot noticed the following build
 warnings: [auto build test WARNING on v6.10-rc4] [also build test WARNING
 on linus/master next-20240618] [If your patch is applied to the wrong git
 tree, kindly drop us a note. And when submitting patch, we sug [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [192.198.163.7 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [192.198.163.7 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [192.198.163.7 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJfyN-00081Q-RY
Subject: Re: [Kgdb-bugreport] [PATCH 11/13] kdb: Abstract out parsing for
 mdWcN
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
Cc: kgdb-bugreport@lists.sourceforge.net, oe-kbuild-all@lists.linux.dev,
 Thorsten Blum <thorsten.blum@toblux.com>, linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jason Wessel <jason.wessel@windriver.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Douglas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.10-rc4]
[also build test WARNING on linus/master next-20240618]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Douglas-Anderson/kdb-Get-rid-of-minlen-for-the-md-command/20240618-084245
base:   v6.10-rc4
patch link:    https://lore.kernel.org/r/20240617173426.11.I899d035485269f5110a3323fbb1680fbba718e4c%40changeid
patch subject: [PATCH 11/13] kdb: Abstract out parsing for mdWcN
config: arc-randconfig-001-20240619 (https://download.01.org/0day-ci/archive/20240619/202406190433.U3alc3Xi-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406190433.U3alc3Xi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406190433.U3alc3Xi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/debug/kdb/kdb_main.c:1606: warning: Function parameter or struct member 'bytesperword' not described in 'kdb_md_parse_arg0'


vim +1606 kernel/debug/kdb/kdb_main.c

  1593	
  1594	/**
  1595	 * kdb_md_parse_arg0() - Parse argv[0] for "md" command
  1596	 *
  1597	 * @cmd:         The name of the command, like "md"
  1598	 * @arg0:        The value of argv[0].
  1599	 * @repeat:      If argv0 modifies repeat count we'll adjust here.
  1600	 * @bytesperword Ifargv0 modifies bytesperword we'll adjust here.
  1601	 *
  1602	 * Return: true if this was a valid cmd; false otherwise.
  1603	 */
  1604	static bool kdb_md_parse_arg0(const char *cmd, const char *arg0,
  1605				      int *repeat, int *bytesperword)
> 1606	{
  1607		int cmdlen = strlen(cmd);
  1608	
  1609		/* arg0 must _start_ with the command string or it's a no-go. */
  1610		if (strncmp(cmd, arg0, cmdlen) != 0)
  1611			return false;
  1612	
  1613		/* If it's just the base command, we're done and it's good. */
  1614		if (arg0[cmdlen] == '\0')
  1615			return true;
  1616	
  1617		/*
  1618		 * The first byte after the base command must be bytes per word, a
  1619		 * digit. The actual value of bytesperword will be validated later.
  1620		 */
  1621		if (!isdigit(arg0[cmdlen]))
  1622			return false;
  1623		*bytesperword = (int)(arg0[cmdlen] - '0');
  1624		cmdlen++;
  1625	
  1626		/* After the bytes per word must be end of string or a 'c'. */
  1627		if (arg0[cmdlen] == '\0')
  1628			return true;
  1629		if (arg0[cmdlen] != 'c')
  1630			return false;
  1631		cmdlen++;
  1632	
  1633		/* After the "c" is the repeat. */
  1634		return kstrtouint(arg0 + cmdlen, 10, repeat) == 0;
  1635	}
  1636	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
