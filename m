Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C85923DEF1D
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  3 Aug 2021 15:30:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mAuVV-00064m-JG
	for lists+kgdb-bugreport@lfdr.de; Tue, 03 Aug 2021 13:30:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <john.ogness@linutronix.de>) id 1mAuVQ-00064U-6l
 for kgdb-bugreport@lists.sourceforge.net; Tue, 03 Aug 2021 13:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zratP/d2dqbzr5A3KZPCTDEa+UpOjiFaTT3D2EIH/Pg=; b=d2NU/8uWy5CsA2PtM/JLL6N0hT
 vzfYPy/6t11r0PvxPqLzHBUL6Yp0KRXlPinlrswoealbtWWjgYQ/20GtqtbHSmdicP5dq/4AMCxY5
 LNHcYCz/PuRuPnFGo/XMR5CrgmsuqupBxWDQs/jri9e0ZI1TnfxqDLFo3wTbS6OqhGA8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zratP/d2dqbzr5A3KZPCTDEa+UpOjiFaTT3D2EIH/Pg=; b=g
 OYPhO6rVHOhzPPjHe+6E/a+wDWdKgac8ROulKYWEumz4GoTGmmfzByJbKNFungopP6mK1WQ37K88a
 mdOWCL7rV8jF9FQ+WeYga2X9Iopqmx4S8ScdsPvrJNaUclvP4JCoqw4+DYnSCnrl1KB9waT29P2aS
 eWeE7GQc5X+TDNBc=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mAuVJ-00B97g-NF
 for kgdb-bugreport@lists.sourceforge.net; Tue, 03 Aug 2021 13:30:52 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1627996383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zratP/d2dqbzr5A3KZPCTDEa+UpOjiFaTT3D2EIH/Pg=;
 b=zk5sPz0A/N68QiMZNa4XnUH53XQGAkBgxmMF9RdDFSoOGdHXqC//ofK9o10vkQtIIgxpxy
 o3gzfJIWcGuD/7CJSo5P2+b6eNhxoNOxZol539AjZC3laI2y9WkzZGJ7p/8XuGC/SI6py5
 6Mpztfu+HxmsRcOTqIZJcFq3yrOVV08E2vhgrY8or5Z3uRGykD2IiT/TXmzbGy4LL+sBHS
 cGTPp1pxVnfmrDUBXMNIf7pO9xGKJUUaHa3+Iftq3TyMFoNPnqWV077wktj4wMXkILY+0N
 qrvzjb5E1n/5VK5Jn8gch/Yneaa2fDy8JybmbeFc/b2DSqzfflXIeOBn73Azfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1627996383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zratP/d2dqbzr5A3KZPCTDEa+UpOjiFaTT3D2EIH/Pg=;
 b=eiwsN3XDO7gIOKIO/tyPKCl9YBM/K+0P9ejFJ1AFeHJgY6RpWMpxmcaTC14bbaMpVCrVQI
 kAWF+aftd/6aNtAw==
To: Petr Mladek <pmladek@suse.com>
Date: Tue,  3 Aug 2021 15:18:51 +0206
Message-Id: <20210803131301.5588-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mAuVJ-00B97g-NF
Subject: [Kgdb-bugreport] [PATCH printk v1 00/10] printk: introduce atomic
 consoles and sync mode
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
 Jiri Slaby <jirislaby@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Al Cooper <alcooperx@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Cengiz Can <cengiz@kernel.wtf>,
 Chengyang Fan <cy.fan@huawei.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>, Changbin Du <changbin.du@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 x86@kernel.org, linux-mediatek@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, linux-mips@vger.kernel.org,
 Wang Qing <wangqing@vivo.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Johan Hovold <johan@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sedat Dilek <sedat.dilek@gmail.com>, Claire Chang <tientzu@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrij Abyzov <aabyzov@slb.com>, linux-arm-kernel@lists.infradead.org,
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

This is the next part of our printk-rework effort (points 3 and
4 of the LPC 2019 summary [0]).

Here the concept of "atomic consoles" is introduced through  a
new (optional) write_atomic() callback for console drivers. This
callback must be implemented as an NMI-safe variant of the
write() callback, meaning that it can function from any context
without relying on questionable tactics such as ignoring locking
and also without relying on the synchronization of console
semaphore.

As an example of how such an atomic console can look like, this
series implements write_atomic() for the 8250 UART driver.

This series also introduces a new console printing mode called
"sync mode" that is only activated when the kernel is about to
end (such as panic, oops, shutdown, reboot). Sync mode can only
be activated if atomic consoles are available. A system without
registered atomic consoles will be unaffected by this series.

When in sync mode, the console printing behavior becomes:

- only consoles implementing write_atomic() will be called

- printing occurs within vprintk_store() instead of
  console_unlock(), since the console semaphore is irrelevant
  for atomic consoles

For systems that have registered atomic consoles, this series
improves the reliability of seeing crash messages by using new
locking techniques rather than "ignoring locks and hoping for
the best". In particular, atomic consoles rely on the
CPU-reentrant spinlock (i.e. the printk cpulock) for
synchronizing console output.

John Ogness

[0] https://lore.kernel.org/lkml/87k1acz5rx.fsf@linutronix.de/

John Ogness (10):
  printk: relocate printk cpulock functions
  printk: rename printk cpulock API and always disable interrupts
  kgdb: delay roundup if holding printk cpulock
  printk: relocate printk_delay()
  printk: call boot_delay_msec() in printk_delay()
  printk: use seqcount_latch for console_seq
  console: add write_atomic interface
  printk: introduce kernel sync mode
  kdb: if available, only use atomic consoles for output mirroring
  serial: 8250: implement write_atomic

 arch/powerpc/include/asm/smp.h         |   1 +
 arch/powerpc/kernel/kgdb.c             |  10 +-
 arch/powerpc/kernel/smp.c              |   5 +
 arch/x86/kernel/kgdb.c                 |   9 +-
 drivers/tty/serial/8250/8250.h         |  47 ++-
 drivers/tty/serial/8250/8250_core.c    |  17 +-
 drivers/tty/serial/8250/8250_fsl.c     |   9 +
 drivers/tty/serial/8250/8250_ingenic.c |   7 +
 drivers/tty/serial/8250/8250_mtk.c     |  29 +-
 drivers/tty/serial/8250/8250_port.c    |  92 ++--
 drivers/tty/serial/8250/Kconfig        |   1 +
 include/linux/console.h                |  32 ++
 include/linux/kgdb.h                   |   3 +
 include/linux/printk.h                 |  57 +--
 include/linux/serial_8250.h            |   5 +
 kernel/debug/debug_core.c              |  45 +-
 kernel/debug/kdb/kdb_io.c              |  16 +
 kernel/printk/printk.c                 | 554 +++++++++++++++++--------
 lib/Kconfig.debug                      |   3 +
 lib/dump_stack.c                       |   4 +-
 lib/nmi_backtrace.c                    |   4 +-
 21 files changed, 684 insertions(+), 266 deletions(-)


base-commit: 23d8adcf8022b9483605531d8985f5b77533cb3a
-- 
2.20.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
