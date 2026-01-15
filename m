Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07692D23E76
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 15 Jan 2026 11:20:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wJXdpkMZy7L52QFMKagE4q8Ridawbx+TkCF7DdACcY=; b=ilOiq6wEb0DGYjelLBDnnrPSaw
	DnkusbQBiwtlSNsv3XkFTrCeOtMb1yf11t7J0AH0Q07tMIHERVK4zP3B6brAejs6G4+5bqeTOZYWk
	ZsAhyu9/NZ3CtJJdEy33NAhA/HCN2c7jeBaj+PnUAfHldiX1wpfjpnxUBhjoIOqbWIiA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vgKSf-0000BY-Lg
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 15 Jan 2026 10:20:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vgKSd-0000BL-KI
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Jan 2026 10:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Blw9ol92Adxv0ebGIyoRpKSiGhl8JOSAW1An3S4C+Hw=; b=T9VidhLGB+7EJFliCgTygh0aJL
 S6FN0KE1SSjN3rYbclkyoVuKQcnuaxcXLBzpM8v2HYCm8CEE2zebONNOh9ZibOp1bhdCt19elORdL
 pU93VkOMJ3WQYk44RTY0tfhdFE+MLceHrqPu6QxsHYZuNQqQIlHVmpUr+Z2Fs/IQYw0c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Blw9ol92Adxv0ebGIyoRpKSiGhl8JOSAW1An3S4C+Hw=; b=L34vQxjMm3wyvUIs1/syRqMTU/
 7cXM4amjLZ8rDQJdEMIdOgU6p58Qbl451qfjJAP+PW9uehf/BfHQ6qDW000pNp5oiXEIVrJpyKTAo
 lW93uS2UFyQsK6pWde9y49jOCiYYTzUGLIA3CMTriGTNL3wsebejwGyKoYSCVzkr1RRs=;
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vgKSd-00059j-7k for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Jan 2026 10:20:15 +0000
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-430f2ee2f00so381494f8f.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 15 Jan 2026 02:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768472404; x=1769077204; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Blw9ol92Adxv0ebGIyoRpKSiGhl8JOSAW1An3S4C+Hw=;
 b=Blir1ZpoOdohy3ZX+LZ9Yx0UM6x4qaRTV1krGp1XfE1XBDup74wMT/qKqpt709Beqf
 dpPXuc4MMO89H4ahTjro7N/lvi/70uR+sFLP/FSpt/4kmbLQO+f4Tw2mEu5qG02uTcwW
 f8lctDZc0GtNijGjNy13sDl7P+Mf8oVYkWzVud25UfkTGkYMvJJ+nh27cgFFKniI1vuw
 abhgBnrq28lveSZ52mBDgb9wyY/YuPc64BznWKo1fBtLWwD5OVD9kvSjHenaSbW4ar4L
 VJ84JeHpo3+JTcgKPI5ELcRvSIXvXJKN8K3L5zUOZDB3EhY31on7dRhBnExl5/G4NHMa
 qe8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768472404; x=1769077204;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Blw9ol92Adxv0ebGIyoRpKSiGhl8JOSAW1An3S4C+Hw=;
 b=P2WCp5ePgNIlSoOaeQaQdLESLPsxLiSYZm9895sbfIv/lX5Bctn3EUYR6lhMt8kq/6
 it90uMtGlL+F5qLYU0AnBfGwnkJjH6orD5V2RzyPHbwUfDoHVL4WiKizo7CwXr1g++hU
 xgwYIoL8/EhBTS9pbPtWJiT3fKTgQgJoPUEsdYjsR+2j8frY50NN4y6hwopFC7cM1wyI
 P/FLBfPzyoe5JQkGlUKKQ6cdG06j6fTNPx1ppbzjULQCqNbMJFmxyF52zxRm3CJ5cuzX
 yBddri+toshKDK5MqhIw2Usfy5/9BYaYdX090X7VjdP3HC/sGactRy2sJRTMeaspNHbb
 zbpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaYM7mdhnMe+tdWYT8sBzpNvr13y1jLQAkUlOVW7nrukiYg6RRMz/ywUVoa/iohEpJaAdu4Mq4+B96oGua5w==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzx1T+clxZ7M5HuzKlrHA3c6SynbE858J0t61l8eTmVfnpn2q57
 1IZ3zmFtzrpP5fSlLeKLh0T2GoMcC5uuI4pRy9BUyGfoyR4G2tISqUcHQn8DtwThqB8=
X-Gm-Gg: AY/fxX62wr4kim6CNmBEC05jSB2ushn6qANIYRgBJDjLODhyZSGUnVud5LzYro9+H5s
 MV4gBmDz02jMMgQ4btcok5UBtohRtTbeQz5GoZy4LQY6GGJsyPu0AJQmvrHxf+SuH9TdSLlpGnF
 bRtvN4cgdU/7FRZMlVKmj5dhyg5qDHYgC1RgUEkUaDyds/vIhkUFY3pVDlYBkZ57gKsNTstdRMS
 7a5+oB91kgBt0RwVRqZoUfK9dZ703Ozhp75zgpgck+cJzRA1GbVs0v7112bceHo9u1HxfpwULNv
 c6dc2Rcd9tr9H94JqWT+xh79NPKPIbtnHpZGr5ECRk/J1A0eFFv8XT5xvHrXVkI4HXrDFU6Vfeb
 ffC38izdQOIk3KCN1m/+cofydiP+Y7QsN7RqQACgIog06MgtZlNIQx0hU0soGLNlTexgD2DO30o
 kUFUVGSXsAIuyQDg==
X-Received: by 2002:a5d:6b41:0:b0:432:a9db:f99d with SMTP id
 ffacd0b85a97d-4342c535db3mr5505744f8f.36.1768472403629; 
 Thu, 15 Jan 2026 02:20:03 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af653632sm5139931f8f.11.2026.01.15.02.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 02:20:02 -0800 (PST)
Date: Thu, 15 Jan 2026 11:20:00 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWi_UJcrphO9Esxw@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-8-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-8-21a291bcf197@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat 2025-12-27 09:16:15, Marcos Paulo de Souza wrote: >
 The register_console_force function was introduced to register consoles >
 even on the presence of default consoles, replacing the CON_ENABLE [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.53 listed in wl.mailspike.net]
X-Headers-End: 1vgKSd-00059j-7k
Subject: Re: [Kgdb-bugreport] [PATCH 08/19] debug: debug_core: Migrate to
 register_console_force helper
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Andreas Larsson <andreas@gaisler.com>, Kees Cook <kees@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Shan-Chun Hung <schung@nuvoton.com>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Breno Leitao <leitao@debian.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, sparclinux@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Richard Weinberger <richard@nod.at>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 Daniel Thompson <danielt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jacky Huang <ychuang3@nuvoton.com>, John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org,
 Nicholas Piggin <npiggin@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sat 2025-12-27 09:16:15, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> No functional changes.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

LGTM, nice cleanup!

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
