Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 055C794E8F6
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Aug 2024 10:54:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sdQol-0002VL-QB
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 12 Aug 2024 08:54:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mail@florommel.de>) id 1sdIJl-00054B-AG
 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 11 Aug 2024 23:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j9vxFOjQggefKmp2PLO4h2j8Q/YG1/6SG7lHqz5wBTc=; b=b1/KZ4r70IKvtTn0cMotR5Rxas
 WvnCCjVPTK+dRw/wJSsDDT38bHjizm+P70JzhNI/xSlrC/CVR/ZEZ9GOHogaNeeZ7cIuj2YjHs1+x
 m11PHf127/rwdCWnZ5FCuuEchFizbKOCaZWYOUZX4JF1pnEAvxGZRqwi0HpxPazAouRw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=j9vxFOjQggefKmp2PLO4h2j8Q/YG1/6SG7lHqz5wBTc=; b=j
 hz+OhmbCFEaEzrIy/BZ96K/lwIHK4bp5pRcOalLPa/r/dlEmRSZmE4/qTDSwgoV3tp0IPvXVXqscg
 fEI79FdzRsO6iHg18KLrJqSb6kMUZoq81AiFAvxylgCLLDpUDp3ih+Gcxx2im9uWYb1VjyPMLGdCe
 2pY4UIlquZsOAZnM=;
Received: from read.uberspace.de ([185.26.156.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdIJk-0007F1-Bw for kgdb-bugreport@lists.sourceforge.net;
 Sun, 11 Aug 2024 23:49:45 +0000
Received: (qmail 8955 invoked by uid 990); 11 Aug 2024 23:22:51 -0000
Authentication-Results: read.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
 by read.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Mon, 12 Aug 2024 01:22:51 +0200
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
Date: Mon, 12 Aug 2024 01:22:06 +0200
Message-ID: <20240811232208.234261-1-mail@florommel.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-2.793181)
 MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: 0.106818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=florommel.de; s=uberspace; h=from:to:cc:subject:date;
 bh=6asL+vlLn7HJUMgv4kf2xzgQ75iFwr4KJvDM6zYEAPs=;
 b=bPif1NlK4QJOjL5M/J6pUNWbNw9/pfvVKli6ImiIh8X3NUYvpdAMI/2FSIQb6pxltJkWD7eNFN
 x7r0C246xxVgonkiRw4FRem57siu/OAj25u4SWg6u2pA+pfigjwyH3Rj1BeTV9mx/rz0bGA/wiR0
 NcncUNfIldWA+/Exb5Iwz2XjbI6xCHhtedV542ju1DBM3TAp58PxksJiC3de47OFmZ/Oq8HZ2scO
 u/Jw7qwJpdFq70N6pdCZFYqXdmBZTRwSKXyTsttY2zNYdeiwNnQhVld2tG5pmWxMRpiL9ZVUTT+L
 y4pqs7qWPFdRHi6UeL6wOnKU7oRio49AFxFcJ/TZGpxdxvPVZ6y5MhaTm2yF0HUR5aFf+GKjeoPb
 e3GazB3nnlZgT6KwZbHWkPFIredHasG7I8AfgXDOSZpuminSPn+nXLZchhIRPPawJEz1aIRLIAam
 cZIjBPVGK6OTHIt5DxlmzOFNCJ6gYmKgq6WwFBEKHMlvJio2UF4B/JFqI2NORbOzkyjDOP/qavK0
 Wrh7rrgM4jZ/nNuEFJq6TOZwFh1tfnQDlLoyfvvmx3V7hkbVQMeWkSllzVFTguQPgP9F3CHIU2dr
 3y+GSzQA0pSeuZCT5xHxxyU2MqMf4lQ8/iBnb3spCOLAkYUwCy5WDt3hyTmysPN0zAaABI9f0F5j
 4=
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This series fixes two problems with KGDB on x86 concerning
 the removal of breakpoints, causing the kernel to hang. Note that breakpoint
 removal is not only performed when explicitly deleting a breakpo [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: florommel.de]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [185.26.156.133 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sdIJk-0007F1-Bw
X-Mailman-Approved-At: Mon, 12 Aug 2024 08:54:17 +0000
Subject: [Kgdb-bugreport] [PATCH 0/2] kgdb: x86: fix breakpoint removal
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

Florian Rommel (2):
  x86/kgdb: convert early breakpoints to poke breakpoints
  x86/kgdb: fix hang on failed breakpoint removal

 arch/x86/kernel/kgdb.c    | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/kgdb.h      |  3 +++
 init/main.c               |  1 +
 kernel/debug/debug_core.c |  7 ++++++-
 4 files changed, 48 insertions(+), 1 deletion(-)

-- 
2.46.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
