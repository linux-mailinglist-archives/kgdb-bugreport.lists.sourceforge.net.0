Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E13C89F29
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 26 Nov 2025 14:12:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AiYgNL9Hlxn7YLsiYg4Daty8FIA9IASbtE90WPQlhac=; b=hjOgoNUGgZO0Did3ufHnb5N1p/
	UGyrgMdypojWtB414DwbGiAN1eVvMtnbd/pw1//JvbeoYLXVosUow3erRv6aMlerrQay6DDzyFb1/
	C+QuQVpY/3Tp10hYvD4IMMt40Z866bPdCmH0WNdLm3K4DqaG7W4d2YtKFOTthDy6YcZs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vOFK0-0004Hd-JO
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 26 Nov 2025 13:12:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vOFJz-0004HW-7L
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 26 Nov 2025 13:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=azsrhZgWyYhx6NRpCHGgrx0NKRpo3MJZPtnrDvh+H7E=; b=SjF2u5tgu+8ASZ94DTMEac5aPa
 AfFm1wkUi1YEGtehO6JVDoI0awVUFWmO09YreXs2QBo1ksYPUDkqv1w9irRt/FIOdtbFTS5pnznoE
 qb+Ba0fDs4e1MKs+Y/Ak5ohL0j2DaEb13UG0q8IzogJTzizH97UWHLbtKEM9fncwYY5k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=azsrhZgWyYhx6NRpCHGgrx0NKRpo3MJZPtnrDvh+H7E=; b=Y5a0Qql3MF6Q4zcYhgATMLLI9I
 8zV2aG0/gUb55najSLHRoKDy+C6PW8XHqpNrhiem1aLlm6/V1vVQ26mXKPPELJU9pvwct2BigPZzB
 q2avTZFG5aZ88yaSw4wyjrJ/Hn73kL0g4P5ST3GY/EJ5tgKowT9pi/A/sK9YdMKtolHo=;
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vOFJy-0001Zc-LD for kgdb-bugreport@lists.sourceforge.net;
 Wed, 26 Nov 2025 13:12:35 +0000
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so6165935e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 26 Nov 2025 05:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1764162743; x=1764767543; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=azsrhZgWyYhx6NRpCHGgrx0NKRpo3MJZPtnrDvh+H7E=;
 b=dwjEmRvG7CcxqBnF3ZRSrR8I9rO1smIQdIKtp9BSUZResyptft79hYj8rIRSrkTJTL
 u79kP188p0asoIxo1fs7MG/Cy+O1QKWDj92JPitpSNB0wfn+gg0RbMj9D/Q+O7DmEJp0
 KhZNT92WQkD5ESv6ecwgskK0PWZ37LO2K2BOgBJC0eJIjoAYkVqVESWhesT02bFOboLr
 86EuK9QooN2+kLayyWs7SIHv7R0LdMeQxTT16uQjIFt/Fc0a5DK1PSahgFHRY++41Gk3
 VYYZCKMcfCzd/yPnDZm+vf6ZBR3SEAbC8YRGp5mFW3Z/iH7xnmxLKejCUoYzbPpPybym
 Jc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764162743; x=1764767543;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=azsrhZgWyYhx6NRpCHGgrx0NKRpo3MJZPtnrDvh+H7E=;
 b=Okryyz8ycA+cumpsA8Hu765muke0laKI+XphuekfEdmHJ5TNWR5xGxIN5o6LXY+bEK
 h8fkHo8NlCAiiSv+hKLe7v2bDvpkwpXjXpt6TzO/g6weM0K+tYZ9dPX05268CXNaoG7X
 Edg7Mq5y/NrOPWtl6J9FuIOT11AfczjSeMmV8kDCVfenQxmmv6tIp+t6dUIzm8t3Z55t
 saxFteoLSRfjuVTyKFCoy2pc2gfp93hqIlHqDQ6+IZvMZIGPHOlJLtQGoqFD851sAbx7
 v2ui0wSTk2HTXmYzJfLBdAPR9wUWahgdm4y1+PcOr4tiohwIDdDZbFSbY1FvT3BJVcff
 pZ1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5t3ATTXrmlE4AXs8Kbzwubl5OmDMtL1v/xLtBi1TxpFH8vdTbkM9cYAQzQxy8mcKjwp/Ej2pvpa6o8BlkrA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzATU6fysnmFol5WvCrd5pqJn6F9aHEaKK04jLiAdLTomd2tw+o
 gFJB7HGdcNhJKF3PuPwYKwAmmTU9j0DtRL4IQUQkJr6ghu4lCYHey5u9s0V4JTgVsf0=
X-Gm-Gg: ASbGncs7LX9xvnzl9Y/qb3jef+JHbvUmJPN4iK3CucGr1/FC0nC6wbY3cDUvkZesehC
 cIxF6y1+KZu90NDRn8UqDoa98+qt5cMuxS57sFW+meZDuuAHjP/JZ9GdZAbc8U7ilKIUD2g1MCI
 WrfFzRm7vrTG5naw48eTmlVRay6EM1t2yeU65pjThEVeR+1Mw/sEDOrA8JfG8OYOuTlBzzrTZF8
 zDtUewZcElHzG2BTC8MbTsv+quypKjf5sf2LxvK4bMSKWz0jo2cd6Kqxbzw62grx7KYjtpeG204
 R+jh8xIlA7C2ayXjTWUgmRVusutrtxkVVI8yViEU2IWOpFVVEfonUIOxcDUf1Zo3HUvja/jlWIO
 +2dHf9N5vlUvEjMvZgT3fgM2kJywHgFidfT/BFnpQQB526maLTFef2LXuYXKEHJeyQG81TYG2c8
 wuFuZlGop6DWb2RA==
X-Google-Smtp-Source: AGHT+IFEYv6UMcwGn4taVzPLuUnJBcIZRl4prj8V/wWkXOqPExh69hNsmDyiZhSbwf/siv21g/oC8w==
X-Received: by 2002:a05:600c:1e89:b0:477:a1bb:c58e with SMTP id
 5b1f17b1804b1-477c04cfddcmr213170355e9.7.1764162743079; 
 Wed, 26 Nov 2025 05:12:23 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f34fe8sm40473140f8f.15.2025.11.26.05.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 05:12:22 -0800 (PST)
Date: Wed, 26 Nov 2025 14:12:19 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aSb8s_N4Pc0yTk9f@pathway.suse.cz>
References: <20251121-printk-cleanup-part2-v2-0-57b8b78647f4@suse.com>
 <20251121-printk-cleanup-part2-v2-1-57b8b78647f4@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251121-printk-cleanup-part2-v2-1-57b8b78647f4@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2025-11-21 15:50:33, Marcos Paulo de Souza wrote: >
 The original code tried to find a console that has CON_BOOT _or_ > CON_ENABLED
 flag set. The flag CON_ENABLED is set to all registered > cons [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.53 listed in wl.mailspike.net]
X-Headers-End: 1vOFJy-0001Zc-LD
Subject: Re: [Kgdb-bugreport] [PATCH v2 1/4] drivers: serial: kgdboc: Drop
 checks for CON_ENABLED and CON_BOOT
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
Cc: Richard Weinberger <richard@nod.at>,
 John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Johannes Berg <johannes@sipsolutions.net>, Jiri Slaby <jirislaby@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2025-11-21 15:50:33, Marcos Paulo de Souza wrote:
> The original code tried to find a console that has CON_BOOT _or_
> CON_ENABLED flag set. The flag CON_ENABLED is set to all registered
> consoles, so in this case this check is always true, even for the
> CON_BOOT consoles.
> 
> The initial intent of the kgdboc_earlycon_init was to get a console
> early (CON_BOOT) or later on in the process (CON_ENABLED). The
> code was using for_each_console macro, meaning that all console structs
> were previously registered on the printk() machinery. At this point,
> any console found on for_each_console is safe for kgdboc_earlycon_init
> to use.
> 
> Dropping the check makes the code cleaner, and avoids further confusion
> by future readers of the code.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

I agree that the check is superfluous and can be removed:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
