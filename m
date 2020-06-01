Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0173B1E9C69
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  1 Jun 2020 06:12:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jfbny-0004ha-Q3
	for lists+kgdb-bugreport@lfdr.de; Mon, 01 Jun 2020 04:12:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jfbnw-0004hI-UQ
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Jun 2020 04:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VOcDnv7hzdo3sm1Ws3sgeoTUJcZ9vO2MwFxGDprhyas=; b=U8fBgx2eQ3XhihahJiOZCQ63Al
 KBdrI3rzXiQ/N15AUbSv2ibWHXcogDc66HIUTCFqVpdIPpxICV9dFx7t/i2FU1uGrwJ9eh/Cn7hbW
 iQQZ+kDBKaQpLeVhqkEjp7BtxL89AyzIoM6H9mzl64XGgxJSo1tfLhdIUAtpMpRATs1Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VOcDnv7hzdo3sm1Ws3sgeoTUJcZ9vO2MwFxGDprhyas=; b=FVfSHEoHqxPmCvFHGdHdG4vNKc
 NTBlIifmY7p76pj6BSwWb6hBN9dwc4ztvmKvv+e6OizNibUeMXhfxEjqtVWQXovpbXGpjTJ4M47Mg
 vDFwrQKXiuVcOhGoAQThJIhk7jJzCmacVKA3dbrzY8oqIq6m4oU1agThn80o6D9c+c00=;
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jfbnv-002oPb-Cy
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Jun 2020 04:12:04 +0000
Received: by mail-oi1-f181.google.com with SMTP id m67so7909110oif.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 31 May 2020 21:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VOcDnv7hzdo3sm1Ws3sgeoTUJcZ9vO2MwFxGDprhyas=;
 b=EwJGNMp/r6zUKSwinf/LZl4fdKCFyw7OFv+Op4LD8DVjO07yERN9f0HUA5j6sDWuRU
 e1avHAZomkvQJcINzt1QxFvIwg//uR6Fx6ko9vvExp2ft4pARaIWGES7QJQo4yFK3j5A
 OdBATrBAmg+tLHX7Naj3oq6UkyQ1XVwgUqqTQmRjXWuJ2iJefIE4JoWWdbfG8PsYkqB5
 2Z/Yn54fsRVOJsuqF5d2CTXRmnrTaJ29yUMuaSoLNw/UrY/rZ6D8XD4SJm9TaggaGoz5
 PkK8sdPFBN+QXPbhvLKi64IVzSUvcrt+EsbQ6gremp+vhkvxvJAfFsgFDYruqe+d4VLr
 vB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VOcDnv7hzdo3sm1Ws3sgeoTUJcZ9vO2MwFxGDprhyas=;
 b=TYVc4PJ81EIDwIt2AYgNEFVl1HU1C4aBinV1hDuSZmoXIjTQw0wmCTAFbjopLmBqP3
 3PQwCMUDUj/2To761COBVwTbgs+ba6JpHuV/SSJdXEIhR5z30SGZt10UJtRZwLe5MbHg
 wR4fu3PVv6tR5S2IeaTFny+FVYyIm90wr38YXlnDjLLZkeSHy7wf0mkxwlYY154IjEh5
 Fm0aos2scuhicIK93bSxu2yQVYC6oBRwIoT0p5nPpCJCE7XS/euh+8c5Chk31anNye6Q
 yQUnVLFv50bp0L63j7HND4PvdcjkVBFUF5el+VcJVqjvcEBfGLsMwl+zrfq2Y8YlmvQE
 RpYQ==
X-Gm-Message-State: AOAM532qfPW/7D4+eA2w35Bj9BQ6a+Hzfii3NihL73sRuUJbBGOTACDM
 x+ZL0Co4JkBqMP7QWrvnHwUJGDCyyBE=
X-Google-Smtp-Source: ABdhPJwyOuOaRg2pwGJdZshQqIGXq+EDKjJqWI4FQhq2tsaol4huk2XOrxhzKY+0wXBBDKwGTpZemg==
X-Received: by 2002:a17:90a:e016:: with SMTP id
 u22mr21329552pjy.28.1590982796823; 
 Sun, 31 May 2020 20:39:56 -0700 (PDT)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (2001-b400-e3df-96c7-30f0-f751-b645-f4e3.emome-ip6.hinet.net.
 [2001:b400:e3df:96c7:30f0:f751:b645:f4e3])
 by smtp.gmail.com with ESMTPSA id a7sm13102527pfa.187.2020.05.31.20.39.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 31 May 2020 20:39:56 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, daniel.thompson@linaro.org
Date: Mon,  1 Jun 2020 11:39:06 +0800
Message-Id: <1590982751-13401-2-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590982751-13401-1-git-send-email-vincent.chen@sifive.com>
References: <1590982751-13401-1-git-send-email-vincent.chen@sifive.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sifive.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.181 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.181 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jfbnv-002oPb-Cy
Subject: [Kgdb-bugreport] [V5 patch 1/6] kgdb: Add kgdb_has_hit_break
 function
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-riscv@lists.infradead.org,
 Vincent Chen <vincent.chen@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The break instruction in RISC-V does not have an immediate value field, so
the kernel cannot identify the purpose of each trap exception through the
opcode. This makes the existing identification schemes in other
architecture unsuitable for the RISC-V kernel. To solve this problem, this
patch adds kgdb_has_hit_break(), which can help RISC-V kernel identify
the KGDB trap exception.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 include/linux/kgdb.h      |  1 +
 kernel/debug/debug_core.c | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index b072aeb1fd78..03c64aa8ba36 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -311,6 +311,7 @@ extern int kgdb_hex2mem(char *buf, char *mem, int count);
 
 extern int kgdb_isremovedbreak(unsigned long addr);
 extern void kgdb_schedule_breakpoint(void);
+extern int kgdb_has_hit_break(unsigned long addr);
 
 extern int
 kgdb_handle_exception(int ex_vector, int signo, int err_code,
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 2b7c9b67931d..01bc3eea3d4d 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -417,6 +417,18 @@ int kgdb_isremovedbreak(unsigned long addr)
 	return 0;
 }
 
+int kgdb_has_hit_break(unsigned long addr)
+{
+	int i;
+
+	for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
+		if (kgdb_break[i].state == BP_ACTIVE &&
+		    kgdb_break[i].bpt_addr == addr)
+			return 1;
+	}
+	return 0;
+}
+
 int dbg_remove_all_break(void)
 {
 	int error;
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
