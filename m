Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6507A61F529
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Nov 2022 15:17:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1os2vx-0007Cb-4K
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Nov 2022 14:17:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1os2vu-0007CE-VN
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Nov 2022 14:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zf2Nnq9aaBhq9OyJBdbPoPZazbYrZ5ZYcguoDhN8w38=; b=cljZF+8hmcDuLo96BrdJg3z7S0
 3cO7pWTJAroRDEfLFLMYhXZHwYhyotoq9+ktF4MwblEVEhhqgi/oX01d1jiscKCVbXK6Blf9YrDP4
 50W90AWRg3XVuH/3NgjgYIOcPBzUYbWKSr8+UQNwhqLxTwbKY98Og/ONf755O2h/I4lA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zf2Nnq9aaBhq9OyJBdbPoPZazbYrZ5ZYcguoDhN8w38=; b=Q
 xjaoGeInibkQg3YCIdtsm3c39CvOjqQ54PlHpiCk9PRUQ9T0FY/f/6vnDx45Grkr8FFYMBLzHmOeb
 tXA0IxrIOUW45gVGVIWIEfmSy2MuyqRlBYDEEz67lc6aHH34EGG6y5kqK2l4VnEEFRFicr458r/nk
 fryQ/8VDtuQdREP0=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1os2vh-00035z-AO for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Nov 2022 14:16:57 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1667830600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zf2Nnq9aaBhq9OyJBdbPoPZazbYrZ5ZYcguoDhN8w38=;
 b=2DMdV6P5I8sPplJufSLuueHeVl4bvVMKaOCMLHG/8T/fwK7DAOABqqdX7aJ+59oIKbSeI/
 jxIUQ7vmqJIWBg5uBPUnLwho/ozyVcK4cifb7E8MZWqNAgvSZcTQkooqi2XOBJKmdFoPe0
 S/wZC7FHNIjNqHF8aKh2I4aJghp93sxvUy5SQTr2sLIW2gINDw/7UBtkXqGJH9YxH5hhOO
 0O67dTObUBp0/Va8bcvOAkYNduQYwv+rsV/BkAAXQ2emD/fAX8uWsiRgCCzSlHK71l+mxd
 DWhAO2yHDDwVwuy7tiy10mhyFAMcwaRZxpwSCRbmOIfW9QXr83hR7vV88Ebaiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1667830600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zf2Nnq9aaBhq9OyJBdbPoPZazbYrZ5ZYcguoDhN8w38=;
 b=jYEgYMmbvDXYj7DRG/zDjOcuyxgqHf6CJ4sMHlEhQTQPnAhOStcpCmHEsG9VmODdbETAmt
 FuRjrih+zd0krvCw==
To: Petr Mladek <pmladek@suse.com>
Date: Mon,  7 Nov 2022 15:21:58 +0106
Message-Id: <20221107141638.3790965-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is v3 of a series to prepare for threaded/atomic
 printing.
 v2 is here [0]. This series focuses on reducing the scope of the BKL
 console_lock.
 It achieves this by switching to SRCU and a dedicated [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1os2vh-00035z-AO
Subject: [Kgdb-bugreport] [PATCH printk v3 00/40] reduce console_lock scope
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 kgdb-bugreport@lists.sourceforge.net, Lai Jiangshan <jiangshanlai@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Joel Fernandes <joel@joelfernandes.org>,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Tom Rix <trix@redhat.com>,
 Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 Aaron Tomlin <atomlin@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Paolo Abeni <pabeni@redhat.com>, Neeraj Upadhyay <quic_neeraju@quicinc.com>,
 Michal Simek <michal.simek@xilinx.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, linux-um@lists.infradead.org,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Lukas Wunner <lukas@wunner.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This is v3 of a series to prepare for threaded/atomic
printing. v2 is here [0]. This series focuses on reducing the
scope of the BKL console_lock. It achieves this by switching to
SRCU and a dedicated mutex for console list iteration and
modification, respectively. The console_lock will no longer
offer this protection and is completely removed from
(un)register_console() and console_stop/start() code.

Also, during the review of v2 it came to our attention that
many console drivers are checking CON_ENABLED to see if they
are registered. Because this flag can change without
unregistering and because this flag does not represent an
atomic point when an (un)registration process is complete,
a new console_is_registered() function is introduced. This
function uses the console_list_lock to synchronize with the
(un)registration process to provide a reliable status.

All users of the console_lock for list iteration have been
modified. For the call sites where the console_lock is still
needed (because of other reasons), comments are added to
explain exactly why the console_lock was needed.

All users of CON_ENABLED for registration status have been
modified to use console_is_registered(). Note that there are
still users of CON_ENABLED, but this is for legitimate purposes
about a registered console being able to print.

The base commit for this series is from Paul McKenney's RCU tree
and provides an NMI-safe SRCU implementation [1]. Without the
NMI-safe SRCU implementation, this series is not less safe than
mainline. But we will need the NMI-safe SRCU implementation for
atomic consoles anyway, so we might as well get it in
now. Especially since it _does_ increase the reliability for
mainline in the panic path.

Changes since v3:

general:

- introduce a synchronized console_is_registered() to query if
  a console is registered, meant to replace CON_ENABLED
  (mis)use for this purpose

- directly read console->flags for registered consoles if it is
  race-free (and document that it is so)

- replace uart_console_enabled() with a new
  uart_console_registered() based on console_is_registered()

- change comments about why console_lock is used to synchronize
  console->device() by providing an example

registration check fixups:

- the following drivers were modified to use the new
  console_is_registered() instead of CON_ENABLED checks

   - arch/m68k/emu/nfcon.c
   - drivers/firmware/efi/earlycon.c
   - drivers/net/netconsole.c
   - drivers/tty/hvc/hvc_console.c
   - drivers/tty/serial/8250/8250_core.c
   - drivers/tty/serial/earlycon.c
   - drivers/tty/serial/pic32_uart.c
   - drivers/tty/serial/samsung_tty.c
   - drivers/tty/serial/serial_core.c
   - drivers/tty/serial/xilinx_uartps.c
   - drivers/usb/early/xhci-dbc.c

um: kmsg_dumper:

- change stdout dump criteria to match original intention

kgdb/kdb:

- in configure_kgdboc(), take console_list_lock to synchronize
  tty_find_polling_driver() against register_console()

- add comments explaining why calling console->write() without
  locking might work

tty: sh-sci:

- use a setup() callback to setup the early console

fbdev: xen:

- implement a cleaner approach for
  console_force_preferred_locked()

rcu:

- implement debug_lockdep_rcu_enabled() for
  !CONFIG_DEBUG_LOCK_ALLOC

printk:

- check CONFIG_DEBUG_LOCK_ALLOC for srcu_read_lock_held()
  availability

- for console_lock/_trylock/_unlock, replace "lock the console
  system" language with "block the console subsystem from
  printing"

- use WRITE_ONCE() for updating console->flags of registered
  consoles

- expand comments of synchronize_srcu() calls to explain why
  they are needed, and also expand comments to explain when it
  is not needed

- change CON_BOOT consoles to always begin at earliest message

- for non-BOOT/non-PRINTBUFFER consoles, initialize @seq to the
  minimal @seq of any of the enabled boot consoles

- add comments and lockdep assertion to
  unregister_console_locked() because it is not clear from the
  name which lock is implied

- dropped patches that caused unnecessary churn in the series

John Ogness

[0] https://lore.kernel.org/lkml/20221019145600.1282823-1-john.ogness@linutronix.de
[1] https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/log/?h=srcunmisafe.2022.10.21a

John Ogness (38):
  rcu: implement lockdep_rcu_enabled for !CONFIG_DEBUG_LOCK_ALLOC
  printk: Prepare for SRCU console list protection
  printk: fix setting first seq for consoles
  um: kmsg_dump: only dump when no output console available
  console: introduce console_is_enabled() wrapper
  printk: use console_is_enabled()
  um: kmsg_dump: use console_is_enabled()
  kdb: kdb_io: use console_is_enabled()
  um: kmsg_dumper: use srcu console list iterator
  tty: serial: kgdboc: document console_lock usage
  tty: tty_io: document console_lock usage
  proc: consoles: document console_lock usage
  kdb: use srcu console list iterator
  printk: console_flush_all: use srcu console list iterator
  printk: console_unblank: use srcu console list iterator
  printk: console_flush_on_panic: use srcu console list iterator
  printk: console_device: use srcu console list iterator
  printk: __pr_flush: use srcu console list iterator
  printk: introduce console_list_lock
  console: introduce console_is_registered()
  serial_core: replace uart_console_enabled() with
    uart_console_registered()
  tty: nfcon: use console_is_registered()
  efi: earlycon: use console_is_registered()
  tty: hvc: use console_is_registered()
  tty: serial: earlycon: use console_is_registered()
  tty: serial: pic32_uart: use console_is_registered()
  tty: serial: samsung_tty: use console_is_registered()
  tty: serial: xilinx_uartps: use console_is_registered()
  usb: early: xhci-dbc: use console_is_registered()
  netconsole: avoid CON_ENABLED misuse to track registration
  printk, xen: fbfront: create/use safe function for forcing preferred
  tty: tty_io: use console_list_lock for list synchronization
  proc: consoles: use console_list_lock for list iteration
  tty: serial: kgdboc: use console_list_lock for list traversal
  tty: serial: kgdboc: synchronize tty_find_polling_driver() and
    register_console()
  tty: serial: kgdboc: use console_list_lock to trap exit
  printk: relieve console_lock of list synchronization duties
  tty: serial: sh-sci: use setup() callback for early console

Thomas Gleixner (2):
  serial: kgdboc: Lock console list in probe function
  printk: Convert console_drivers list to hlist

 .clang-format                       |   1 +
 arch/m68k/emu/nfcon.c               |  10 +-
 arch/um/kernel/kmsg_dump.c          |  24 +-
 drivers/firmware/efi/earlycon.c     |   8 +-
 drivers/net/netconsole.c            |  21 +-
 drivers/tty/hvc/hvc_console.c       |   4 +-
 drivers/tty/serial/8250/8250_core.c |   2 +-
 drivers/tty/serial/earlycon.c       |   4 +-
 drivers/tty/serial/kgdboc.c         |  46 ++-
 drivers/tty/serial/pic32_uart.c     |   4 +-
 drivers/tty/serial/samsung_tty.c    |   2 +-
 drivers/tty/serial/serial_core.c    |  14 +-
 drivers/tty/serial/sh-sci.c         |  17 +-
 drivers/tty/serial/xilinx_uartps.c  |   2 +-
 drivers/tty/tty_io.c                |  18 +-
 drivers/usb/early/xhci-dbc.c        |   2 +-
 drivers/video/fbdev/xen-fbfront.c   |  12 +-
 fs/proc/consoles.c                  |  21 +-
 include/linux/console.h             | 111 +++++++-
 include/linux/rcupdate.h            |   5 +
 include/linux/serial_core.h         |  15 +-
 kernel/debug/kdb/kdb_io.c           |  14 +-
 kernel/printk/printk.c              | 424 +++++++++++++++++++++-------
 23 files changed, 605 insertions(+), 176 deletions(-)


base-commit: e29a4915db1480f96e0bc2e928699d086a71f43c
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
