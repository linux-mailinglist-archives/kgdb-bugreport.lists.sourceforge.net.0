Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DD974D867
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 10 Jul 2023 16:04:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qIrVa-0004DA-An
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 10 Jul 2023 14:04:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1qIrVW-0004Cc-9C
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 10 Jul 2023 14:04:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MqQQHifjCL0c2OnScyIKu+7EiHoYi5j4PKb/MmJ4YBA=; b=gqy/SUBvglJBX3bcQamK94Seo9
 LC98SLP6Y75C6XhAyl+pA43bxoP/egxPwVJAH5gGTFzsCUKbuGqshohPpig3ej2bAjRJuIsc2HU8+
 FZH2x3dYk/pz7iHTVciY7gzxT5oeYsThjgIFW1d7z6/4qDpnMSRfui1EkxIyTIeRbqEM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MqQQHifjCL0c2OnScyIKu+7EiHoYi5j4PKb/MmJ4YBA=; b=E
 UXvQiSznJHzQhVR3uqRYJw3EnpJKsHlIzUVxTl/pwUjTSOWE3TykLj6/svjD5/2HLytM721waS/sZ
 U8UAwoE9rBb/4vONgAcheqjQTEdv9m+Jy9Nokcc/W045Y9vN3fJbJG6ojT/WrlKRN8JLM10wUuy7O
 CiZVhfjlLqGaxeEs=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qIrVT-003Oww-FV for kgdb-bugreport@lists.sourceforge.net;
 Mon, 10 Jul 2023 14:04:54 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1688996727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=MqQQHifjCL0c2OnScyIKu+7EiHoYi5j4PKb/MmJ4YBA=;
 b=OYec+o0KCOOMwsAfbtONOyof+75wVZgRLD2p5Ragkko/rI9iROmI++kcRgw7NcXsMP/aUy
 OqMhd7M3j/l7Cr3qrlv2+W/kWjJGUqAfy1B0iHJgxl3aLDpLRsBwFW95jd9H7nhm0cTZ43
 cRXClf2IZBBu6sy2gU1RRDCcNlopiMeEciXXgGVOIQAF/RGrqUhiJGvLopfyYucZeq8qxj
 bvmTXG7Hy000m7nmS7gInhx8/py1oQ4HQFVTsp7w+NojIq/DWGV/DuIjwSSTyv5YLD3ys5
 CE7tklijPZdN75G21yNM+UidRBLiwv2cLujHgDWnBaHxwGUYooY74A4lUO1fHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1688996727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=MqQQHifjCL0c2OnScyIKu+7EiHoYi5j4PKb/MmJ4YBA=;
 b=NzZe8c77yHkyAWz/iVBJWdIWGLOw5m7u9FzXMD/Sc+4z5UzWEm8Ns0yDB8rDS9YZbksRrR
 SS/pWGdMjQa29bBg==
To: Petr Mladek <pmladek@suse.com>
Date: Mon, 10 Jul 2023 15:51:19 +0206
Message-Id: <20230710134524.25232-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, This is v2 of a series working towards threaded/atomic
 console printing. This series is only a subset of the original v1 [0]. That
 series began with various cleanups before adding the threaded/atomic [...]
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qIrVT-003Oww-FV
Subject: [Kgdb-bugreport] [PATCH printk v2 0/5] various cleanups
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Aaron Tomlin <atomlin@atomlin.com>, Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

This is v2 of a series working towards threaded/atomic console
printing. This series is only a subset of the original
v1 [0]. That series began with various cleanups before adding
the threaded/atomic code. Since none of those cleanups made it
into the recent 6.5 merge window, I have decided to post them
as their own series. I hope this helps to get them accepted
without being attached to any threaded/atomic discussions.

Changes since v1:

- drop patches 5-18 (they will return in a follow-up series)

- console_unblank() aborts if called from NMI context

- console_flush_on_panic() directly flushes rather than using
console_lock/_unlock dance (because console_lock/_unlock is not
NMI-safe)

- remove @console_suspended and rely only on CON_SUSPENDED flag

- rename abandon_console_lock_in_panic() to
other_cpu_in_panic()

- console_trylock() and console_lock() will fail and block,
respectively, while another CPU is in panic

- adjust various comments and whitespace as suggested

John Ogness

[0] https://lore.kernel.org/lkml/20230302195618.156940-1-john.ogness@linutronix.de

John Ogness (5):
  kdb: do not assume write() callback available
  printk: Add NMI safety to console_flush_on_panic() and
    console_unblank()
  printk: Consolidate console deferred printing
  printk: Add per-console suspended state
  printk: Rename abandon_console_lock_in_panic() to other_cpu_in_panic()

 include/linux/console.h     |   3 +
 kernel/debug/kdb/kdb_io.c   |   2 +
 kernel/printk/internal.h    |   2 +
 kernel/printk/printk.c      | 189 +++++++++++++++++++++++-------------
 kernel/printk/printk_safe.c |   9 +-
 5 files changed, 132 insertions(+), 73 deletions(-)


base-commit: 7ec85f3e089aa423a69559bf4555b6218b5a2ef7
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
