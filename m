Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F803DEF57
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  3 Aug 2021 15:52:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mAuqT-0002Lz-OY
	for lists+kgdb-bugreport@lfdr.de; Tue, 03 Aug 2021 13:52:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mAuqR-0002Lt-MC
 for kgdb-bugreport@lists.sourceforge.net; Tue, 03 Aug 2021 13:52:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lEKQqiJpS+Vuaj4Le3umJoaZo3OML0wqLOPbxvsaiUc=; b=FkPKUWFRmPHMChWobI+7totuwK
 aCF6A/1BlDe47qlywTSp136atXqMWLGVJeB/rFu0TCwgVt+GTrOZxAN39dWVbZ1eJBgmvuL5NsUAW
 Xq3sGxI8cbkwkeVykg+UP7PjIz7lw74DPzQhPQ6VvUNx7k01hYl34fAp3/31OVV2Wqvs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lEKQqiJpS+Vuaj4Le3umJoaZo3OML0wqLOPbxvsaiUc=; b=SqTWVH10xJlsBq+s25mtGdQ0Xx
 hlbJe9L5qoNiZp2jn6b7gdsfITFxtl6TyyKzxTEmaIaIW7WJtjla5jHYjMKAlFWMc6kZ/6/bL3Z0C
 3hANreTaidS/dq8a8649/QSDN5udgtZ3Xt9pqNM+BjDwnC3sneOZifTwFMkklJ/mYkBs=;
Received: from mga11.intel.com ([192.55.52.93])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mAuqN-00BA1g-0J
 for kgdb-bugreport@lists.sourceforge.net; Tue, 03 Aug 2021 13:52:35 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="210582403"
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="210582403"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 06:52:25 -0700
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="670439422"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 06:52:12 -0700
Received: from andy by smile with local (Exim 4.94.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mAupt-004kJM-Mo; Tue, 03 Aug 2021 16:52:01 +0300
Date: Tue, 3 Aug 2021 16:52:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <YQlKAeXS9MPmE284@smile.fi.intel.com>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210803131301.5588-1-john.ogness@linutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1mAuqN-00BA1g-0J
Subject: Re: [Kgdb-bugreport] [PATCH printk v1 00/10] printk: introduce
 atomic consoles and sync mode
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Jiri Slaby <jirislaby@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Al Cooper <alcooperx@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Cengiz Can <cengiz@kernel.wtf>,
 Chengyang Fan <cy.fan@huawei.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>, Changbin Du <changbin.du@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 x86@kernel.org, linux-mediatek@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 linux-serial@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux-mips@vger.kernel.org, Wang Qing <wangqing@vivo.com>,
 Petr Mladek <pmladek@suse.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Johan Hovold <johan@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sedat Dilek <sedat.dilek@gmail.com>,
 Claire Chang <tientzu@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
 Eddie Huang <eddie.huang@mediatek.com>, Andrij Abyzov <aabyzov@slb.com>,
 linux-arm-kernel@lists.infradead.org,
 kuldip dwivedi <kuldip.dwivedi@puresoftware.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Zhang Qilong <zhangqilong3@huawei.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Guenter Roeck <linux@roeck-us.net>, Jason Wessel <jason.wessel@windriver.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, linuxppc-dev@lists.ozlabs.org,
 Vitor Massaru Iha <vitor@massaru.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Aug 03, 2021 at 03:18:51PM +0206, John Ogness wrote:
> Hi,
> 
> This is the next part of our printk-rework effort (points 3 and
> 4 of the LPC 2019 summary [0]).
> 
> Here the concept of "atomic consoles" is introduced through  a
> new (optional) write_atomic() callback for console drivers. This
> callback must be implemented as an NMI-safe variant of the
> write() callback, meaning that it can function from any context
> without relying on questionable tactics such as ignoring locking
> and also without relying on the synchronization of console
> semaphore.
> 
> As an example of how such an atomic console can look like, this
> series implements write_atomic() for the 8250 UART driver.
> 
> This series also introduces a new console printing mode called
> "sync mode" that is only activated when the kernel is about to
> end (such as panic, oops, shutdown, reboot). Sync mode can only
> be activated if atomic consoles are available. A system without
> registered atomic consoles will be unaffected by this series.
> 
> When in sync mode, the console printing behavior becomes:
> 
> - only consoles implementing write_atomic() will be called
> 
> - printing occurs within vprintk_store() instead of
>   console_unlock(), since the console semaphore is irrelevant
>   for atomic consoles
> 
> For systems that have registered atomic consoles, this series
> improves the reliability of seeing crash messages by using new
> locking techniques rather than "ignoring locks and hoping for
> the best". In particular, atomic consoles rely on the
> CPU-reentrant spinlock (i.e. the printk cpulock) for
> synchronizing console output.

If console is runtime suspended, who will bring it up?
Does it mean that this callback can't be implemented on the consoles that
do runtime suspend (some of 8250 currently, for example)?

-- 
With Best Regards,
Andy Shevchenko




_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
