Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A45F162853D
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 14 Nov 2022 17:29:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oucLI-0008Rx-CW
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 14 Nov 2022 16:29:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1oucLH-0008Rp-Ao
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 14 Nov 2022 16:29:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2ia89HZSRLXOgXaOdEDVfM/lt8urljrOhJdnHfXmKjU=; b=AaBYP5zkmi+m+LjejqEVjwzDcr
 lfuKHv3lcloH955jsw6/G0PN6YSLN4fr/007IJEtFwEYRoqtzRPT8jyYrNSu7CyEooeAl2C0BTGJK
 Q0lPtMQY42+F7J/EeuHWuAvThSsVcm9r6YbQN8bFHsCEU3RBX73Oj0fXGPo7GQdZVgwU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2ia89HZSRLXOgXaOdEDVfM/lt8urljrOhJdnHfXmKjU=; b=E
 S1RIiD2yw+Wrav7zYqX0sTl8SdLq6kJVJjPmo/wOocq9yw6DOHRCAI8w/KF7JS18FCNDfWHHjFDka
 UH7qoberpgRYv+UMSF19bkBZIrtPCoDhOQ3NGTgljJQoCB1r5WWItSlQGN/CHt/JxpoYxeEq8pazA
 z9mxedTggoQKf5v8=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oucLD-0000gy-1g for kgdb-bugreport@lists.sourceforge.net;
 Mon, 14 Nov 2022 16:29:51 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1668443374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2ia89HZSRLXOgXaOdEDVfM/lt8urljrOhJdnHfXmKjU=;
 b=YiZgYIzbGCS66YXIbnxE6HJSvuTozQJVm58tUWdD2n4y28gjtW1uZFFKiE4stX4GyLd79p
 +YNdGDP8PJqfheCbYANqK1Acwttrp3+h1Arxlm6dnx/imsSfHBTsvWINJO1FTQWjJLFhec
 x9r0v+8OmvuighJO6BPLWW3526LiM9UaibGBRmcynkQdxf8FtKRpskdXdCeaQDDIl9q+DS
 /iw1SO/WUFNDXJkVPXBCXepuK+u5fcd7eB1JJwMSHpqzBybgcxVOcAekyMdJIDu6B57+G0
 3iJH018PYhIpqraxqEXvulW/RG3bmOcweaxcG4nokqF6cr2lDsbBuWvm+JkA9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1668443374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2ia89HZSRLXOgXaOdEDVfM/lt8urljrOhJdnHfXmKjU=;
 b=yWQ3DUdGxE8HiQ+BCoA7MfdIFiUkgVb02pKvTJXiNVqXlQM6ZDYyW+UBcx0rL+UguDA25s
 z9obC1MVjJfJPMCg==
To: Petr Mladek <pmladek@suse.com>
Date: Mon, 14 Nov 2022 17:34:53 +0106
Message-Id: <20221114162932.141883-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is v4 of a series to prepare for threaded/atomic
 printing.
 v3 is here [0]. This series focuses on reducing the scope of the BKL
 console_lock.
 It achieves this by switching to SRCU and a dedicated [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1oucLD-0000gy-1g
Subject: [Kgdb-bugreport] [PATCH printk v4 00/39] reduce console_lock scope
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Tom Rix <trix@redhat.com>,
 Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 Aaron Tomlin <atomlin@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Paolo Abeni <pabeni@redhat.com>, Michal Simek <michal.simek@xilinx.com>,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, Jakub Kicinski <kuba@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Lukas Wunner <lukas@wunner.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This is v4 of a series to prepare for threaded/atomic
printing. v3 is here [0]. This series focuses on reducing the
scope of the BKL console_lock. It achieves this by switching to
SRCU and a dedicated mutex for console list iteration and
modification, respectively. The console_lock will no longer
offer this protection.

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
needed (for other reasons), comments are added to explain
exactly why the console_lock was needed.

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

- Implement console_srcu_read_flags() and console_srcu_write_flags()
  to be used for console->flags access under the srcu_read_lock or
  console_list_lock, respectively. The functions document their
  relationship to one another and use data_race(), READ_ONCE(), and
  WRITE_ONCE() macros to annotate their relationship. They also make
  use of lockdep to warn if used in improper contexts.

- Replace all console_is_enabled() usage with
  console_srcu_read_flags() (all were under the srcu_read_lock).

serial_core:

- For uart_console_registered(), check uart_console() before taking
  the console_list_lock to avoid unnecessary lock contention for
  non-console ports.

m68k/emu/nfcon:

- Only explicitly enable the console if registering via debug=nfcon.

tty/serial/sh-sci:

- Add comments about why @options will always be NULL for the
  earlyprintk console.

kdb:

- Add comments explaining the expectations for console drivers to
  work correctly.

printk:

- Some code sites under SRCU were checking flags directly. Use
  console_srcu_read_flags() instead.

- In register_console() rename bootcon_enabled/realcon_enabled to
  bootcon_registered/realcon_registered to avoid confusion.

- In register_console() only check for boot console sequences if a
  boot console is registered and !keep_bootcon. In this case, also
  take the console_lock to guarantee safe access to console->seq.

- In console_force_preferred_locked() use hlist_del_rcu() instead of
  hlist_del_init_rcu() so that there is never a window where the
  console can be viewed as unregistered.

John Ogness

[0] https://lore.kernel.org/lkml/20221107141638.3790965-1-john.ogness@linutronix.de
[1] https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/log/?h=srcunmisafe.2022.11.09a

John Ogness (37):
  printk: Prepare for SRCU console list protection
  printk: register_console: use "registered" for variable names
  printk: fix setting first seq for consoles
  um: kmsg_dump: only dump when no output console available
  tty: serial: kgdboc: document console_lock usage
  tty: tty_io: document console_lock usage
  proc: consoles: document console_lock usage
  printk: introduce console_list_lock
  console: introduce wrappers to read/write console flags
  um: kmsg_dumper: use srcu console list iterator
  kdb: use srcu console list iterator
  printk: console_flush_all: use srcu console list iterator
  printk: __pr_flush: use srcu console list iterator
  printk: console_is_usable: use console_srcu_read_flags
  printk: console_unblank: use srcu console list iterator
  printk: console_flush_on_panic: use srcu console list iterator
  printk: console_device: use srcu console list iterator
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
  tty: serial: kgdboc: use srcu console list iterator
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
 arch/m68k/emu/nfcon.c               |   9 +-
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
 drivers/tty/serial/sh-sci.c         |  20 +-
 drivers/tty/serial/xilinx_uartps.c  |   2 +-
 drivers/tty/tty_io.c                |  18 +-
 drivers/usb/early/xhci-dbc.c        |   2 +-
 drivers/video/fbdev/xen-fbfront.c   |  12 +-
 fs/proc/consoles.c                  |  21 +-
 include/linux/console.h             | 129 +++++++-
 include/linux/serial_core.h         |  10 +-
 kernel/debug/kdb/kdb_io.c           |  18 +-
 kernel/printk/printk.c              | 459 +++++++++++++++++++++-------
 22 files changed, 648 insertions(+), 182 deletions(-)


base-commit: f733615e39aa2d6ddeef33b7b2c9aa6a5a2c2785
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
