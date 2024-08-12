Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E2C94F602
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Aug 2024 19:45:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sdZ6m-00089h-Op
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 12 Aug 2024 17:45:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mail@florommel.de>) id 1sdZ6k-00089X-Qx
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 12 Aug 2024 17:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5+btF9GMP3+vTZNVi5qmQM77LZiKzO7CCGwzW1LPUXs=; b=KkBD3AQKldphndmuckNCwEGgjR
 5noTizt0yFUdnCgAcbxcWwCKzouPW963bHpbnmhemHWy6qlrMKzy01WKPsI9SIMKjy9WN8ynbE7Ol
 QdwQ6Slfs26qdjeVdfNPvdogzfikYKFZ8LN2DBbsCpZHFbf9KCB9XG61FuLgU9OtwOEM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5+btF9GMP3+vTZNVi5qmQM77LZiKzO7CCGwzW1LPUXs=; b=B
 r691ZN1+w1we9BKTiJTjCQcOGkz0ahktox6qehhsxqJ2iJe7tNUQ59N4vDXT4xWGyY4/lOSi8sQ6e
 /yaKw0UjZm960DJpEhY/Sp30bkBQABCHYcLYRrt69C1GUcE025EEU5VNrWtzc95BOYCLpVkeeG5i9
 44YqivL5L4mHBR58=;
Received: from read.uberspace.de ([185.26.156.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdZ6k-0008Gj-0i for kgdb-bugreport@lists.sourceforge.net;
 Mon, 12 Aug 2024 17:45:27 +0000
Received: (qmail 19526 invoked by uid 990); 12 Aug 2024 17:45:18 -0000
Authentication-Results: read.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
 by read.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Mon, 12 Aug 2024 19:45:18 +0200
From: Florian Rommel <mail@florommel.de>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Lorena Kretzschmar <qy15sije@cip.cs.fau.de>,
 Stefan Saecherl <stefan.saecherl@fau.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Randy Dunlap <rdunlap@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 kgdb-bugreport@lists.sourceforge.net, x86@kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 12 Aug 2024 19:43:35 +0200
Message-ID: <20240812174338.363838-1-mail@florommel.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-2.755498)
 MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: 0.144501
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=florommel.de; s=uberspace; h=from:to:cc:subject:date;
 bh=T88emezkzHvFJIY1FU+CWOWblCLzrtTe/ItS1ZINM0A=;
 b=omz5qer/TuV+JLZ3OsoXTyeZEB7Yuw0azBeN+c6DIIyjsBYPw4Ja4L2xvMakiQ5+wR0CUysiC1
 iAW3UZbSTBiQmLYSQgkBU7NHRQQt8BqXZIsgZg8IpJVplu0mxBgwPZxAT+lJWcbuT9WCX4XlMrMo
 TYs5fkBbvJ8v7xWGcLIIbRQzF8Qa6lL5CFyl0BVlP5Xh3Zu7tw3rBi/JjDUgPfmWCj5A496asyx8
 lxyBOv2I/n2IvjT3WEE47QO7j1+yoYK1fviIUuxrORDqrK+HFd5b+fEqI8X5vNxQwRuH2o7K1jI/
 VyqxhVkCdVwbJLdDOC8rf9SOHd5Qh2+VXhX20N38TXqo6p7EMK6BPOy+Yf6UHfV9eQM9AV9tN/0x
 AvgCEfC55qEFdFwqrm+PRjnW5rQ2sOuZC3p5/Hj2mfSzxwZ1d/YDxUmCLof1KbZOhMogfTvQLbcd
 3OsQ2Mx0qBttSc9UfQF0Z1iRMIP0rFJV1A2WUHtdUTRjJuhAR/f8/WOi81s3UNB6nrhAWnl3pYYb
 IAPIQG4/lxDKWG4oCqDXVsp05iPNzo2wHVXiEk7msdGiagq5PAaZp7zggbjPl51gKy0MUrCfpzND
 o0MxqqaIZL6GLFLoshdwsgvHwxeLa5p/MPkxN5ZcIW6kpbpAt6iINoh4BKkvyclzWUApZ7I3pT49
 k=
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This series fixes two problems with KGDB on x86 concerning
 the removal of breakpoints, causing the kernel to hang. Note that breakpoint
 removal is not only performed when explicitly deleting a breakpo [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: florommel.de]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [185.26.156.133 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sdZ6k-0008Gj-0i
Subject: [Kgdb-bugreport] [PATCH v2 0/2] kgdb: x86: fix breakpoint removal
 problems
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
Cc: Florian Rommel <mail@florommel.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This series fixes two problems with KGDB on x86 concerning the removal
of breakpoints, causing the kernel to hang.  Note that breakpoint
removal is not only performed when explicitly deleting a breakpoint,
but also happens before continuing execution or single stepping.

v2:
 - Add missing stub implementation for kgdb_after_mark_readonly in [1/2]
   when KGDB disabled
 - Link to v1: https://lore.kernel.org/all/20240811232208.234261-1-mail@florommel.de/

Florian Rommel (2):
  x86/kgdb: convert early breakpoints to poke breakpoints
  x86/kgdb: fix hang on failed breakpoint removal

 arch/x86/kernel/kgdb.c    | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/kgdb.h      |  4 ++++
 init/main.c               |  1 +
 kernel/debug/debug_core.c |  7 ++++++-
 4 files changed, 49 insertions(+), 1 deletion(-)

-- 
2.46.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
