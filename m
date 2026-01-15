Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B04BD23E46
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 15 Jan 2026 11:16:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jBH2fVwQ64ggU1X2GjdzrkUTXoRzQXjIT/uhffOPbY8=; b=De3l3kDjDEEa5LhQA7CAwClBmG
	diuDrSXnTnxlDdeST2mcYU42fqKOshBs2LN4n3cZPtM0XCxmLf6lKN5QDcO9L6Z6vKxH2jPo1r6Ri
	R8Geduk2xGRu6nnsJ8+2jx5/rjWWyHwASF84R7h1ZUPNOMceDPEgozN7H3EVNWVGafGM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vgKPI-0007p6-31
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 15 Jan 2026 10:16:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vgKPH-0007oy-AJ
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Jan 2026 10:16:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zwLrvsF0GMvPSCBeAjAWQZcmbWMJVYh05GZu4CqMmyk=; b=T8BA/+aDvWVxyIHXqtVSYUOTjs
 qiKPpLjmXrq7xUnyZ7lUiaqBi8A674+d+2JX53w8akR+iaEYOKfokkqi8PvyEsoWGhtwtYDsqKXpG
 mUeiEwRwzyDqkdG9hNkkE/QhTnQg1zAqMtbOHH9wlSzaS/J/75vFWvWpJPSQMPSp5ea0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zwLrvsF0GMvPSCBeAjAWQZcmbWMJVYh05GZu4CqMmyk=; b=DP+P10da+LcalatZEBsygzgzC4
 5sakCq5+fIwhwLF/Q5DJA75vFOb75aKWrAfzM8OxfcC7/U8WgkAKAiNblGyN3Ek+rhtgAwGhFRk8Z
 yQ0VO2Rcox8KMTwlwYOQ2xjqiWFgyRMQGBp8MBxaSHFCIatPsdD7+lCllE3fh4NMeURY=;
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vgKPG-0004xa-Ve for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Jan 2026 10:16:47 +0000
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4801c1ad878so2005165e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 15 Jan 2026 02:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768472195; x=1769076995; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zwLrvsF0GMvPSCBeAjAWQZcmbWMJVYh05GZu4CqMmyk=;
 b=Okk6403z6dTiX47TYlwJR/QLgVfACX+gKltfXuu1HLep5SGi+ED9RTbGuEz/5VPXY3
 4JUGuZVCL1BQCFaUBcxUWNICKI55eQPp3DFwq33R3wMADm/6FbfqLgwqpz/bN2Pb13Zp
 1y8Kv0SgEhdAGoD6cbAsRSg2MSazvCWHUnqhOmVQjzrDESVKjVuMztCjDckqwDX0gTS5
 EE8n9Cm/lv2L7rTm8h8xM6G1s3t/JNa8FHmYBzstzLR+tP4MWiaOM03pOYKP/uC7ZHO8
 2gftAyxRWpFW+PR4iVS7U4RIl+FxT7nXUbIIYcMugu8kJNRgnag9H5aGwIv009jVGyCD
 HW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768472195; x=1769076995;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zwLrvsF0GMvPSCBeAjAWQZcmbWMJVYh05GZu4CqMmyk=;
 b=WuGrAJ66qYqXMYDbqrNu5irHxbgpB97Hm2V5jYgj/5xyh4ThRn+TuOD7AJRPrxzju7
 GI+pVWTQTlVWeyIB41FdRkpGQgooWqETm5kEYiqnOl02QoLchFV2XKDncL0NLwcZXnSM
 RYMG0UBbhnrFHT8X469AV/eB/O+lLsLz6MiweAgDc5UTHMhqSSNq/5gduCb4D2Gg4XhG
 ro+VOkhygfdLS21w0ltOBHRIBrpU/CpSV66zXZacY5LXmYJc8tEudjYA+dED+vYV2AOZ
 2vszERfj2zcb+Q9UEdftBt1zeLmwiJLAt6NkATqJ0nOwoii8dtAYDgJbdEdQ3krplTBR
 p5Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD0BjZ3dHBEa+EaoCFx5WzCrNGYT3qbEVlRD/huWGaRVEAhC0sF7VK6JxydujlVeDbfD//96FpicZ6mLIXlQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyQqbtfhv63wB9HZJdf1w9ic3kIFDcqGA9XopIr3gCzTg75OZHq
 fkiS2TznjXH3LcT/XNJhu18WA5gS2aBS219btVlGMwJlyg7Veqp5lPq+eSYC8iEsPE4=
X-Gm-Gg: AY/fxX7iwGjgHnA7REatRN+rrRmrcwi4iUEk0W/aWoIhZdaYp2b7jQLCri+5Krow4hg
 A5kNCtHhfQp9CCEbEzUFVzMerOvQS+/x76w3FiEmE/BGGYzGWeXYPVeJOD8EcKGScg3mp8dvO07
 eSJzK+kZhW7bdZCFy7Dcp1BnqNtV4/xMcui88ROnNKuzI/Oz8LiO9P81cxRH91HAvrHyQ7LpnTF
 +h+6wQd7ZsL12i5WRa1roWfGYbW4oEHBjzO83T4sN+d2jTiGTW/BI771KONq1R6kDwg0BA1vfTo
 UcNPcn6tCIPEqx7BXCNvLtE1aPdQJO9x8/JwdePvIsBQGon1/Hk2KFZXijSbyuqe56BYWAV41z0
 xv6yOc1DP3rbR8kSiJb4EeogAWyyXlqj0btwvImYhSQCKrIu+BvmI6YpFbqIZH+pPa91eVUT52l
 qU9uVRbm91jLfBo90FwAs+2UxI
X-Received: by 2002:a05:600c:608c:b0:477:a246:8398 with SMTP id
 5b1f17b1804b1-47ee32e0829mr58296485e9.2.1768472195426; 
 Thu, 15 Jan 2026 02:16:35 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee28144aasm39739585e9.11.2026.01.15.02.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 02:16:34 -0800 (PST)
Date: Thu, 15 Jan 2026 11:16:31 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWi-f9LBJtxGWgWs@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-7-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-7-21a291bcf197@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat 2025-12-27 09:16:14, Marcos Paulo de Souza wrote: >
 The register_console_force function was introduced to register consoles >
 even on the presence of default consoles, replacing the CON_ENABLE [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.53 listed in wl.mailspike.net]
X-Headers-End: 1vgKPG-0004xa-Ve
Subject: Re: [Kgdb-bugreport] [PATCH 07/19] drivers: netconsole: Migrate to
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

On Sat 2025-12-27 09:16:14, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.

I would add "No functional changes." like you did in the other
similar patches ;-)

> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

Nice clean up!

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
