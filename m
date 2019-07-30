Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1D17B654
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 31 Jul 2019 01:41:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hsbk4-0003HE-Kv
	for lists+kgdb-bugreport@lfdr.de; Tue, 30 Jul 2019 23:41:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1hsbk1-0003H4-JK
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jul 2019 23:41:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BSa7l69bHF4dPAb8gb5NP/5/SL+YaF6sYOOZvuhAWNI=; b=KQpU90Odghm0tpxUMzpbHrTTzk
 Xh5I7B6CyjUpKj7ib9YfyJY0ZSmbdcLXdwPEGvbI9xG2t4WY13AhPpG4aXi0QCgiA51TdlQQBeudY
 Zb/m7q4RXNzNE0kZHyw1XvskDth1hbGChS9eYAsQiTwl1G1BZXsq7HHgWw+AN94n9M0E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BSa7l69bHF4dPAb8gb5NP/5/SL+YaF6sYOOZvuhAWNI=; b=M
 rXK/DKWLuqCISpLabrn1UZpir3HWg6huJYTzkAy4+7xgCIcr4PDzxBIqWtIZuFSJqgfyjBzlpvIdH
 0PgpZhZ0OLqqg9NgRM0/ZPTKwLxHAD03vl8lr3K6EPb7cAQM2XwFk2axer/B1PiM1kTlaWZMEqtAo
 I8xy+yvnoBLqzeJ0=;
Received: from mail-pl1-f193.google.com ([209.85.214.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hsbjz-001pte-C0
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jul 2019 23:41:13 +0000
Received: by mail-pl1-f193.google.com with SMTP id ay6so29560771plb.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 30 Jul 2019 16:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BSa7l69bHF4dPAb8gb5NP/5/SL+YaF6sYOOZvuhAWNI=;
 b=MoqGY6iTg3hEO4gKx4Wtf3pREuvvP0H7nvS1wLo0diUb+vTJKR+vvBSQ4FF0nxpYzg
 sHGhTOg6OVimuC48NJhn/Hwu3P2aK1D/xsIJWXY8WLT0vAw/qDbF0cJE8bST3SvdkZoU
 bNhwoPpAdn+FnMjJdzKHo4F+aetnvnhz7ohTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BSa7l69bHF4dPAb8gb5NP/5/SL+YaF6sYOOZvuhAWNI=;
 b=ICBhJVJd7RSQ9tftuHkROubzbeOjc2JMbbOFlv1zDGu6yqIwlGgRmKu+IAMzJuk/pt
 hMroF8/wVk44iKSAdFfr94hB+mXGfz8rx77spVUkoSWvFpxV1K6Jdh6RaEjNCWnMkb/B
 S8XfQ4jO1lWwOeJdjyA2yLwW7gfwv5P/YHKdoyGKhOynIr/n1nsd+m64Bpp8qAhNb6CK
 kpHNNrn/LbC3KynHXQhx7F8uWE7F07L/dr5ucd7Yqzhq4oQ07XF1a1Q86QOs+CzoUddr
 AmOR4o1RaI8ZrOjF4rq+fzLtIsrT6o7Wvh934c+MDWdSPaKEKh2P4vgPF7UouV5jRy5U
 hOSQ==
X-Gm-Message-State: APjAAAXbK2+rgBPD25XQcJqoayZmE0DmHFjYGAyVjLY0VaqgL8pulvpo
 1YFfocO1pL8CZ2uFIqsCi483DpY0xs0=
X-Google-Smtp-Source: APXvYqw50DenQEnXnau8Bdn4emzZ6IKTq2ieNJ4qbNkD4Vd5HZ17BL/ufMmVvw8xiv/DUn1JsEA6mg==
X-Received: by 2002:a17:902:24a2:: with SMTP id
 w31mr41359301pla.324.1564530065665; 
 Tue, 30 Jul 2019 16:41:05 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id u128sm74772530pfu.48.2019.07.30.16.41.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 16:41:05 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 30 Jul 2019 16:40:52 -0700
Message-Id: <20190730234052.148744-1-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: symbols.py]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hsbjz-001pte-C0
Subject: [Kgdb-bugreport] [PATCH] scripts/gdb: Handle split debug
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
 kgdb-bugreport@lists.sourceforge.net, Stephen Boyd <swboyd@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Some systems (like Chrome OS) may use "split debug" for kernel
modules.  That means that the debug symbols are in a different file
than the main elf file.  Let's handle that by also searching for debug
symbols that end in ".ko.debug".

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 scripts/gdb/linux/symbols.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
index 2f5b95f09fa0..34e40e96dee2 100644
--- a/scripts/gdb/linux/symbols.py
+++ b/scripts/gdb/linux/symbols.py
@@ -77,12 +77,12 @@ lx-symbols command."""
             gdb.write("scanning for modules in {0}\n".format(path))
             for root, dirs, files in os.walk(path):
                 for name in files:
-                    if name.endswith(".ko"):
+                    if name.endswith(".ko") or name.endswith(".ko.debug"):
                         self.module_files.append(root + "/" + name)
         self.module_files_updated = True
 
     def _get_module_file(self, module_name):
-        module_pattern = ".*/{0}\.ko$".format(
+        module_pattern = ".*/{0}\.ko(?:.debug)?$".format(
             module_name.replace("_", r"[_\-]"))
         for name in self.module_files:
             if re.match(module_pattern, name) and os.path.exists(name):
-- 
2.22.0.709.g102302147b-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
