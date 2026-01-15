Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C502D23EEB
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 15 Jan 2026 11:26:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYv5eQTupC1rGqmdJMbN8NBbEcpc5HRVEsBtn04FFNQ=; b=c6p+bPDslw5dy3phTIL9fSmqvz
	HXWZHAMi8BZEz900iyIPatBe+1/p078jc7odoEVtmwxwuiw+eFQRkOExHiB6/xLxH9xq42AFWxVa3
	YqxUz1uU9ItrjZikMWieVQorcFfRTejM9tcLphlKqHV2ga8Lg6JghZmNLqzWn5qjvXx4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vgKYr-00080y-4P
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 15 Jan 2026 10:26:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vgKYp-00080r-GV
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Jan 2026 10:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JLly7CGERK95lIS5prsdJ95HAbwiiwFAFGJDvTd/YQs=; b=c5bluBzV8nP8G2cULXgw7xs/J9
 0tRQpN+eA1mPN+bRcIo6wlNpxdnp94YfnrNO7cJS2ioXRk2abahucsBPRJ9yGWRkIgaKiSWqxblC2
 jDTUPjFA8wsoE1UcY2HU7aOnliCPiNKBWX7F3NLYDK4Ch4tvtye/sLaeIA6D1TDT+5M0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JLly7CGERK95lIS5prsdJ95HAbwiiwFAFGJDvTd/YQs=; b=XvfZeBOBhcCxZxAtjgLDP4HB/1
 BjgvJxhBefL71RMS9kmvUpskVB/XRhh5+1gBs3VmbbFODaOSrW2ChL6Wxo9Nlj+LPi0Jj047PjwqB
 xByYKJW07BTV5WhzfzbtCNQEdoP8nNWRPJUIkwKpKOt0ESjhDHw8l44Wt+1N4cvPdzJ8=;
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vgKYp-0005Kb-4F for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Jan 2026 10:26:39 +0000
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-480142406b3so2386385e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 15 Jan 2026 02:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768472787; x=1769077587; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JLly7CGERK95lIS5prsdJ95HAbwiiwFAFGJDvTd/YQs=;
 b=GEqHhsLmSSVvjstdxh5A781gFwB9aOa96dQ+Cz2FyjcarKfbOMEOuIc2j/QAO68eTI
 vaKCbBf/5f53Z9jrw1z4VfoHP2QOfIsiVuC/rk87x5LxrBPUc7QzSjtsR8x7s+45yo8x
 m2nguSTA0rupMmxG3SOAq2qIWxfdp4Np4ZtEpj/mbKANvJT2Ciif7kgBmcAfQl/i67lG
 k8VkpCfvmNDs7oZBOLUhLgdnGAEzm7Iqn1ZGgtTA8vmHyRfCXGxTmQpB9Lql+1bd5aTC
 0rQNjzS9bDrYHbfNpcX/KX2LpBnK+XN/TDn+j/scuuITx2YKkvRQwtcfZPTUCoq5yT1/
 rqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768472787; x=1769077587;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JLly7CGERK95lIS5prsdJ95HAbwiiwFAFGJDvTd/YQs=;
 b=ACP50p+pN07X/jh8puOC3K76INtWCDh+meA54IunbFlVpiBV6h/2mBNO6rv9KIwTEf
 KNv+ftYz48g5kBed7JVStjATleldQk6g1ZplZhE/aFoU3E6yCpqpaDEVQb87wc4FIwcA
 Tuj4M+fpVYb9qsrmUKLu8Qp4CgP29rgBLMWFg+oGqDn74uQkgD4nsukMTbpNYeh64lDw
 2c/BsPGQyC0dt5rfxC6vZxuIzjDuQWecvEvBZb27M8hnkVTVT8gowWLx4DyMVW376q7P
 kEDta/EdfByBOseEQ7zIguTV9j9izViXIBRzLMDsTZvu7SN+h/XrW86o3LOZbSHQ+e16
 cfRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkYZHELy9pNRs5vIiCCU1+7A3UCwiZX9m2X8GT8h1JobZuo9w2zfRDXDdX/vKL+cBDUNnR3N+XojXwnCerRw==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz9+90W1wZGkln5jDWjOibRj+UTCuu8V938j379AJ0DGuuYxdJx
 dIWiIm70WA4AK7hQ0YXJN7UjAzW6vBVA2PKZzFqX/3P1SIyzu3eLZrUNbgEB1rPULKg=
X-Gm-Gg: AY/fxX6oBsnfySU8Jeh55hQh7MXlSq6VtdXgU4GFdeYix4B7fqJ5ucYDDtDJhurBsub
 1h2zvsTCGUpKh1VZWDsFWiiePdwlE8A0c39y30UtJUKw38m40bcoLgPwOgSzweZeZ/G41R9Www8
 EzWqT8Gjfg4KuXms6hRSFYiMQLP5nLD9IIvdPFL0el2VSdPuviGU4FfibXRVDXnMxmbMAwEht5W
 kzAx4Y0oUJKWi2ys0KIq8AbbzyJiPX+RkGe4Ic3Pta0Z7Nk96ab+Cc/45GYWlB1qvoR8a/k0Pye
 UUjDrrWr5LTDVAs2uJqZEU2tBmKCSPX5ims0+mQywEc08sBxjWS0Jfzb2FKFmyNZqD5p7oVXul0
 bLlL330WoDJsp5xrPEVgV23oj76zy69X+J90HVjpiK+hQ1GT1AOW66IwsdKSSuypStMPCppGtPG
 SUVeuoD+fr6v2+bA==
X-Received: by 2002:a05:600c:8b77:b0:477:afc5:fb02 with SMTP id
 5b1f17b1804b1-47ee4819d6emr64067955e9.21.1768472787399; 
 Thu, 15 Jan 2026 02:26:27 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af6d90aasm4935338f8f.29.2026.01.15.02.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 02:26:26 -0800 (PST)
Date: Thu, 15 Jan 2026 11:26:18 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWjAysWXHUOHSisl@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-9-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-9-21a291bcf197@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat 2025-12-27 09:16:16, Marcos Paulo de Souza wrote: >
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
 [209.85.128.52 listed in wl.mailspike.net]
X-Headers-End: 1vgKYp-0005Kb-4F
Subject: Re: [Kgdb-bugreport] [PATCH 09/19] m68k: emu: nfcon.c: Migrate to
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
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sat 2025-12-27 09:16:16, Marcos Paulo de Souza wrote:
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
