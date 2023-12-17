Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FDB815DCA
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 17 Dec 2023 07:43:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rEksR-0001fK-1g
	for lists+kgdb-bugreport@lfdr.de;
	Sun, 17 Dec 2023 06:43:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1rEksP-0001f0-13
 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 17 Dec 2023 06:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kRztQcaw2qOnTjmDY6Lo4gpIvMD80Mi7s9GbAEaGkzE=; b=J//JtPyLY/aRf2P9JiEdvU9gl4
 ul3EFPHP/cefXAce86/EkelSIh6SXS+MY5UEY6LBFr0hyjVWVcfSMb6TjeUd5ZINlf9bIJ2R3qeW0
 nBAWrZ9ZfPb+UWOs9hJ4rxTzaziWPJXwJUTmVdwF4Id5nyYZ2pGI5Y0eR5YQC6Ddq80w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kRztQcaw2qOnTjmDY6Lo4gpIvMD80Mi7s9GbAEaGkzE=; b=QzvupDj02sm/G8ZCa8GJ1A/Pl8
 sS6hOG/ig1vx2shinpxJs2bJudyW7zyNswQgTGUtPseDksWO5BFsSWsp+b0sZDhrgZCBhIW0P4yVY
 f+aJTjosttgYOSC4GFVxgMXiKR143wQghxE1v1fBLsl8BYabPZ/hnEtASQ5MSdDIHmtM=;
Received: from mgamail.intel.com ([192.198.163.8])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rEksL-0003zm-DU for kgdb-bugreport@lists.sourceforge.net;
 Sun, 17 Dec 2023 06:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702795425; x=1734331425;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5JlpsvbWOqFLfck4pPpsmwWV8XlbmxCzw6ZMnROIL8c=;
 b=gaCPeFC36JEObaVNB4u82bSI1uIOpYeUDLD0mVLW67jgXgkU+4UGsS4s
 /FHVoZQMzaP+PEZyyFeusPTkrRRy/lOjTJB7X6LDMn3KkiC2kqjdfq0wJ
 1OsIujJ1W1U1gMuHKnvqtcN8iCZ9ogWnl04JyedEoecoYVoUyH5LuU/LA
 49nBzQxkwhPqrvn5ZM2rCVi8Nas01d9IQ9bulfcYAUWfGQgLqAP1j+6UH
 warmHApr+9+GIr/1MArDVswp1dlnHF3hzDJM4Qu//ARTOXfMctjxmsnkK
 2r8AJo+/F5lgjOk189KdlNnw+xnVTf+Lab3uLJDPWLqIQrf4b3W8aSC2Y A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="8827579"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="8827579"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2023 22:43:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="948412847"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; d="scan'208";a="948412847"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 16 Dec 2023 22:43:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rEks5-0002lD-1l;
 Sun, 17 Dec 2023 06:43:29 +0000
Date: Sun, 17 Dec 2023 14:43:02 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Trimarchi <michael@amarulasolutions.com>
Message-ID: <202312171453.mT4pH4uH-lkp@intel.com>
References: <20231216173409.1264655-1-michael@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231216173409.1264655-1-michael@amarulasolutions.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Michael, kernel test robot noticed the following build
 errors: [auto build test ERROR on tty/tty-testing] [also build test ERROR
 on tty/tty-next tty/tty-linus linus/master v6.7-rc5 next-20231215] [If your
 patch is applied to the wrong git tree, kindly drop us a n [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rEksL-0003zm-DU
Subject: Re: [Kgdb-bugreport] [PATCH] tty: serial: kgdboc: Fix 8250_* kgd
 over serial
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
Cc: daniel.thompson@linaro.org, gregkh@linuxfoundation.org,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, jason.wessel@windriver.com,
 kgdb-bugreport@lists.sourceforge.net, jirislaby@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Michael,

kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next tty/tty-linus linus/master v6.7-rc5 next-20231215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Trimarchi/tty-serial-kgdboc-Fix-8250_-kgd-over-serial/20231217-013726
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20231216173409.1264655-1-michael%40amarulasolutions.com
patch subject: [PATCH] tty: serial: kgdboc: Fix 8250_* kgd over serial
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231217/202312171453.mT4pH4uH-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171453.mT4pH4uH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171453.mT4pH4uH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/serial_core.c: In function 'uart_poll_init':
>> drivers/tty/serial/serial_core.c:2636:33: error: lvalue required as left operand of assignment
    2636 |         if (!port || port->type = PORT_UNKNOWN || !(port->ops->poll_get_char && port->ops->poll_put_char)) {
         |                                 ^


vim +2636 drivers/tty/serial/serial_core.c

  2618	
  2619	static int uart_poll_init(struct tty_driver *driver, int line, char *options)
  2620	{
  2621		struct uart_driver *drv = driver->driver_state;
  2622		struct uart_state *state = drv->state + line;
  2623		enum uart_pm_state pm_state;
  2624		struct tty_port *tport;
  2625		struct uart_port *port;
  2626		int baud = 9600;
  2627		int bits = 8;
  2628		int parity = 'n';
  2629		int flow = 'n';
  2630		int ret = 0;
  2631	
  2632		tport = &state->port;
  2633		mutex_lock(&tport->mutex);
  2634	
  2635		port = uart_port_check(state);
> 2636		if (!port || port->type = PORT_UNKNOWN || !(port->ops->poll_get_char && port->ops->poll_put_char)) {
  2637			ret = -1;
  2638			goto out;
  2639		}
  2640	
  2641		pm_state = state->pm_state;
  2642		uart_change_pm(state, UART_PM_STATE_ON);
  2643	
  2644		if (port->ops->poll_init) {
  2645			/*
  2646			 * We don't set initialized as we only initialized the hw,
  2647			 * e.g. state->xmit is still uninitialized.
  2648			 */
  2649			if (!tty_port_initialized(tport))
  2650				ret = port->ops->poll_init(port);
  2651		}
  2652	
  2653		if (!ret && options) {
  2654			uart_parse_options(options, &baud, &parity, &bits, &flow);
  2655			console_list_lock();
  2656			ret = uart_set_options(port, NULL, baud, parity, bits, flow);
  2657			console_list_unlock();
  2658		}
  2659	out:
  2660		if (ret)
  2661			uart_change_pm(state, pm_state);
  2662		mutex_unlock(&tport->mutex);
  2663		return ret;
  2664	}
  2665	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
