Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAE6AD6F60
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 12 Jun 2025 13:49:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/RVq6OXs7N2dPDq3N+FNLMaepKtNTxCq15ZUGrBx+E=; b=SQrEnpu3DVqHEiKzPTQfLFMPae
	Jv3vGZWU8b5PVn4PHPF6ZWZY8XjNcLubKjKkaWYQ1k8aBglgi+0TOvnONMdt/6ZT39d79x2KKYujO
	vPQt3lZiqz8YaFc8WzBhuQkZekZK7HDDFVibbpGBomY6C0Fo7pAjqW9dJ/3fsI0py/6c=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uPgQY-0002n4-4K
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 12 Jun 2025 11:49:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uPgQW-0002mq-Oi
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 12 Jun 2025 11:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5m7niiETefPh3jsyRBPpvjabz9C/Ks+ZOhKIPRZzytc=; b=T6FCJQaWe5yTyGaxKfpUeMDw1r
 +mWgMgOw6awEgYDB3VHmwn+ndhFUIp0yoKX9e4VWEDPFECdlL9Ck3D9XxNkNzoBZ4zPjfeJICky7W
 GRchDcHgzVehlQcSUCkiO+wNWqamvJCqNqlpeCJjhw9xS7p5rBLUsiZCkKKtBUSaJ51g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5m7niiETefPh3jsyRBPpvjabz9C/Ks+ZOhKIPRZzytc=; b=HXOK5+D8RaZDVXiohtnLz5cf0x
 epSmky8K4/USjG42tWvXB9NnJyqKtgcaaIc2T1Xgb6K62Yw3Ucez1w9a8IfvwYxMzKBXTI+Uat+eg
 H74c54Eg1K5UIJnzLiz3bsIzlAH0xbd3OcRHfzBDRT2gFsBC4zHek4NIFvcuK/td4jU8=;
Received: from mail-wm1-f46.google.com ([209.85.128.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uPgQW-0002R6-EN for kgdb-bugreport@lists.sourceforge.net;
 Thu, 12 Jun 2025 11:49:00 +0000
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-450cb2ddd46so4417675e9.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 12 Jun 2025 04:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1749728929; x=1750333729; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5m7niiETefPh3jsyRBPpvjabz9C/Ks+ZOhKIPRZzytc=;
 b=VYPNpw7m0jYOQSYyvabZYpR1Rv1/5uY37XWcpkfuAtpql9Gg9pzfD4mPV/dCLvC53t
 7c3vduKX5Vj+ubvYL8ssvu+OBQYQm3H8uAF/WUM8uRLqh3uxg3bqUdkYCD1gUwckK7F7
 vNhH6bkpg/vM/Ic8xFgwEECluA9sHEl3YlsaVKrE078hl4mhNCJmnWGWzQH6osVGLs/7
 AZvhgt8iMPGYIWObhltyYjvcKLmIiv19eY2HngNoGpldU7BA0wxsBU+bIFFC4V29YsCo
 GHOQxK3HBBxKhc1KWzDRaMMYzELb4V3TF40SlahQZUIPtS6QzE+x1bb85fk0JQT4ALer
 VYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749728929; x=1750333729;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5m7niiETefPh3jsyRBPpvjabz9C/Ks+ZOhKIPRZzytc=;
 b=pa1yIjYsAzb1O4j90gWAx+yWcKgvZyDNG7EVqwaeWn3+auudiDK+Kjk67fIzBpElP6
 gyUqQI5V2oGKH9SslZ+PgMREbjU3xaMbx88DfKXOvsTD6KmAomFXOIV7e7W2VQ52YusP
 oEseaVxlaza/Xr/l0MY2GWV6WK8J2Y6qYxK8ctX1c9qzO7+BD/9rDsFn1uTaJkvyRd/O
 Bhb3snOb+aI6hkiHt+Jt4O2YsUqcGOwQy/eiCVAyvJuqbKPuIF75NF/u82YCObI5dwf2
 OzSzB3CbazQwAG0ZSME8+xo8QZ+kY5kiDPXDhZ4MdYzl9oaQutZHEJ1/+uz/zkYeo7QA
 rK5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/SJxgH5HrrWOFAghxlfm+dWwEYb0/u95D/L2rSSD6D0PEK3V10e7FZQKcX9yrxZz3SkAViXBBhduTkwdrQg==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxfzCm8vtg1+gNCUqzWQTDdxFzbq8Yo5AvuyElg/80MRuV/iSck
 8L24mdBVgo4VGjXbiN3kY2GVd+irWZX7RevRH+cwCIb9KX7B2RHBINiyi14IK0yLJ00=
X-Gm-Gg: ASbGnctPkXPLy86XW7u6Q+Xiozgd8P5JI4Baqi+QU0HAJ6bemQxz2iTtzqDedKFWGdE
 KMKkCP3YzOTfkVdR7AYd6YbgpBVKRjYRp0b/RPQQMrgLR7ql+Acf2zZYTZ/qRCjBXmxR0kAi/DY
 //KuDULydOJFniIMpADk0uCnF+x/yIIOqvKspuZrR8v4GA+H2urFKRNgW/XR0zVASpd5IBpM0CD
 UefUppireep+qrlp+R7CW5ZqGw4932Hd60wgtZAQM1cRm8y5soRh313b35jcU5JAFmuC4h4JIxM
 DMKHjZcbwYx1wBEIVHHE8R9IUoLk7JMU9XVvooba+WuWEBmsTeU5PO34RonLoDab
X-Google-Smtp-Source: AGHT+IF8zRqV5wheeGN/Jp/GL6rwWbAWoucvbBo3Q9yO7s/hldTXZgL3tDSMI9f+6V734a8pX4n7YQ==
X-Received: by 2002:a05:6000:288a:b0:3a4:f7f3:2d02 with SMTP id
 ffacd0b85a97d-3a558695742mr5484054f8f.17.1749728928892; 
 Thu, 12 Jun 2025 04:48:48 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748809d2b63sm1220811b3a.83.2025.06.12.04.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 04:48:48 -0700 (PDT)
Date: Thu, 12 Jun 2025 13:48:29 +0200
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aEq-jS3u90XCHCSS@pathway.suse.cz>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-3-f427c743dda0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250606-printk-cleanup-part2-v1-3-f427c743dda0@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2025-06-06 23:53:45, Marcos Paulo de Souza wrote: >
 All consoles found on for_each_console are registered, meaning that all of
 > them are CON_ENABLED. The code tries to find an active console, [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.46 listed in wl.mailspike.net]
X-Headers-End: 1uPgQW-0002R6-EN
Subject: Re: [Kgdb-bugreport] [PATCH 3/7] drivers: tty: Check CON_SUSPENDED
 instead of CON_ENABLED
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

On Fri 2025-06-06 23:53:45, Marcos Paulo de Souza wrote:
> All consoles found on for_each_console are registered, meaning that all of
> them are CON_ENABLED. The code tries to find an active console, so check if the
> console is not suspended instead.

This patch "fixes" a behavior change caused by the 1st patch. Please,
merge it into the 1st patch to avoid regressions when bisecting.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
