Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD215E8674
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 24 Sep 2022 02:05:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1obsfN-0007CX-KR
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 24 Sep 2022 00:05:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1obsfL-0007CQ-OF
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 24 Sep 2022 00:05:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aIZ/p/zzcUdqvZHBfaTh7iNfzROHCGADiXc3h/IYPhs=; b=BnOkfXETJfGf5Qeey8uRxfF0s4
 W8gd+bnyL7VUCov6Qo6BsAGf9b4ICyziS/73VPOddeCQLPDZA3cUZo2cNUOBoNMSddI0ZAJHX/Bxb
 AMlyDbJX5Nu1kFXfcVd9W7pMBvFSa8NQeAR3ig0kLdhZVoPFSHhHpY2wQNrM7aFzKVXI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aIZ/p/zzcUdqvZHBfaTh7iNfzROHCGADiXc3h/IYPhs=; b=O
 ywMRM05N70BtZk2cDZeg0zJc/auEowSHf4i0g/9uLIlghBEZAeu1rDFMf+ySv4Wvq53hFoauTnY6I
 10/KNqXF6X6z3xBX50f61d6+PQPdTJyWhg00le9PeESJpeqsEwtfCid+opmbrQc42gKDZfbfX0IXH
 efg2s+xuZpiStGiY=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1obsfK-000XBx-JA for kgdb-bugreport@lists.sourceforge.net;
 Sat, 24 Sep 2022 00:05:07 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1663977895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=aIZ/p/zzcUdqvZHBfaTh7iNfzROHCGADiXc3h/IYPhs=;
 b=tCZMo4OJzUDsRF8Tt5+dc9rVSfsM8skI4n+zWXwCUkL8CFC32e6KCXNJYzr7jmUCSiy7PK
 d9ZVBFsHn5tVkGw/58xnFgn8uhx7BTppvYVU7Vd4CaZ2bIRNe8Z/Ii/vYBnlumMa3r3Hq3
 49kHaqlbV5niuvxKHiUPpIHDZsJZQw1iJD8rOb3wM23v9LK2MTpnIthq8+Q6WNMEqYUufP
 PMS42lqeKjpuGybID818ebteZp2Kb3z4H0DJdG80La4a8KFtliJL5kdAiqEuYYZCQlPrl1
 P+/5opPrHYIwb+TO/xBD8nL5QfWxEhOeCKp9VOoMS4tpmc0c4KjlfXyhkmGRAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1663977895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=aIZ/p/zzcUdqvZHBfaTh7iNfzROHCGADiXc3h/IYPhs=;
 b=G1F2Ln97f+/dUnOPn//ayxn+aXiNDFuWDxoBSCqEd1WNNf6v/RbGXOH0HkyRnz8gTDiImh
 gtw3fZf+UFXvSmDA==
To: Petr Mladek <pmladek@suse.com>
Date: Sat, 24 Sep 2022 02:10:36 +0206
Message-Id: <20220924000454.3319186-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, This series is essentially the first 18 patches of tglx's
 RFC series [0] with only minor changes in comments and commit messages. It's
 purpose is to lay the groundwork for the upcoming threaded/atomic [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linutronix.de]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1obsfK-000XBx-JA
Subject: [Kgdb-bugreport] [PATCH printk 00/18] preparation for
 threaded/atomic printing
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
Cc: Julia Lawall <Julia.Lawall@inria.fr>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Sven Schnelle <svens@stackframe.org>, linux-parisc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Aaron Tomlin <atomlin@redhat.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, John David Anglin <dave.anglin@bell.net>,
 Jiri Slaby <jirislaby@kernel.org>, kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

This series is essentially the first 18 patches of tglx's RFC series
[0] with only minor changes in comments and commit messages. It's
purpose is to lay the groundwork for the upcoming threaded/atomic
console printing posted as the RFC series and demonstrated at
LPC2022 [1].

This series is interesting for mainline because it cleans up various
code and documentation quirks discovered while working on the new
console printing implementation.

Aside from cleanups, the main features introduced here are:

- Converts the console's DIY linked list implementation to hlist.

- Introduces a console list lock (mutex) so that readers (such as
  /proc/consoles) can safely iterate the consoles without blocking
  console printing.

- Adds SRCU support to the console list to prepare for safe console
  list iterating from any context.

- Refactors buffer handling to prepare for per-console, per-cpu,
  per-context atomic printing.

The series has the following parts:

   Patches  1 - 5:   Cleanups

   Patches  6 - 12:  Locking and list conversion

   Patches 13 - 18:  Improved output buffer handling to prepare for
                     code sharing

John Ogness

[0] https://lore.kernel.org/lkml/20220910221947.171557773@linutronix.de
[1] https://lore.kernel.org/lkml/875yheqh6v.fsf@jogness.linutronix.de

Thomas Gleixner (18):
  printk: Make pr_flush() static
  printk: Declare log_wait properly
  printk: Remove write only variable nr_ext_console_drivers
  printk: Remove bogus comment vs. boot consoles
  printk: Mark __printk percpu data ready __ro_after_init
  printk: Protect [un]register_console() with a mutex
  printk: Convert console list walks for readers to list lock
  parisc: Put console abuse into one place
  serial: kgdboc: Lock console list in probe function
  kgbd: Pretend that console list walk is safe
  printk: Convert console_drivers list to hlist
  printk: Prepare for SCRU console list protection
  printk: Move buffer size defines
  printk: Document struct console
  printk: Add struct cons_text_buf
  printk: Use struct cons_text_buf
  printk: Use an output descriptor struct for emit
  printk: Handle dropped message smarter

 arch/parisc/include/asm/pdc.h |   2 +-
 arch/parisc/kernel/pdc_cons.c |  55 +++--
 arch/parisc/kernel/traps.c    |  17 +-
 drivers/tty/serial/kgdboc.c   |   9 +-
 drivers/tty/tty_io.c          |   6 +-
 fs/proc/consoles.c            |  11 +-
 fs/proc/kmsg.c                |   2 -
 include/linux/console.h       | 197 +++++++++++++---
 include/linux/printk.h        |   9 -
 include/linux/syslog.h        |   3 +
 kernel/debug/kdb/kdb_io.c     |   7 +-
 kernel/printk/printk.c        | 414 ++++++++++++++++++++++------------
 12 files changed, 499 insertions(+), 233 deletions(-)


base-commit: dc453dd89daacdc0da6d66234aa27e417df7edcd
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
