Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E244C8A00B
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 26 Nov 2025 14:25:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAMXUqWpBs6ENiTa2KPiqw62dZAYfzCJY/fsqh9XY7s=; b=eqUYP2Kf4QI06sUgmqQlCUW5nA
	BZxiMC/wpgN4cj/vBbDeGir7uSoMsUD4nBNNBH7+OAvEvr+STmBY+AHyoOlchbSMB9uhCZzwDFe2l
	k6RfOoPnPFZlkLTdPXR9V48tQ5n5mQdZYrZlaZo7n6SCLIRualr+Pgox9Ksm10qjNs00=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vOFWM-0007dg-F1
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 26 Nov 2025 13:25:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vOFWD-0007cp-8c
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 26 Nov 2025 13:25:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0f4JQ430d3gYxGe5A4S7xjaYOrTUOg5SC/fVmpakeBc=; b=AQbZkGcVs3DMB1u7qmsgWG5TRQ
 ZSNePo+8f7a8zQwP1G1rfITfn9kqaF1OsiwmR3fXuBVHDhvKeNf0UFhDpL1C9wwXFKIaOMG6103PR
 XlErs8WJ/7NAQ5MJLbv/DzP2G5o5woY6lTWPzr+N2yBoYKrEwnU/aC3zs7q8GCc6KLaA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0f4JQ430d3gYxGe5A4S7xjaYOrTUOg5SC/fVmpakeBc=; b=bxT+J+aDsbQF4ESFaH38vvvseT
 AxboUABz5FLWj8KDK/MyXr4YFfeLphGVJPnJRMayrCNytRAGb51q2l9RlrldMx3kusQ/r1MMcanlT
 pIANndHlnwpMtPWapIvXLufTqbQqrrL3XMqRXUxp12xgaBQKCrjVYNx39cJO7kxKcRxk=;
Received: from mail-wr1-f48.google.com ([209.85.221.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vOFWD-00024p-Gw for kgdb-bugreport@lists.sourceforge.net;
 Wed, 26 Nov 2025 13:25:13 +0000
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-42bb288c1bfso3947306f8f.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 26 Nov 2025 05:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1764163502; x=1764768302; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0f4JQ430d3gYxGe5A4S7xjaYOrTUOg5SC/fVmpakeBc=;
 b=FYJHsLDNgmbondEzbMuS6vZWcDr6kUsEIERPgYRbKu5Jwdc1Oj8A4FLsfksMVaZ/kX
 iH/XrEVWT2gQLBSwZLaQDRJpeOXuSD0BwcbiXJ66tDKjHpJp6cUVi9dpbCDfA34Rl4eU
 OD8vxPfcJE3ej1akfleVaoIhWvqbQr9lpjJGqFi5/AXgvDVmt9tpnhWX4UTO6Xa8F89k
 Ljc/IXAcej0oJoTljQFmKkNtKDbvD6NSFlsoT6Obk6oHmf+1aSc/Po2sDeDdqOS1+Ev0
 VLEdAuo9CNm0nmOtFWPx9byE3LLUYDgVIMmuFh5KGeoZn1Nr9BnY2BRFj2o18VcRhank
 GddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764163502; x=1764768302;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0f4JQ430d3gYxGe5A4S7xjaYOrTUOg5SC/fVmpakeBc=;
 b=wDqUfvVO+/kvwd4knx0ZdZnRI5C83+E+Vm1H7cQSzZlbZZY/Gwd9RLYyUmvhlmPFTY
 pXJkv3ti6b75c1uAf9rspLO2Q4t1wZHy4adpEg/qVzBUT1ZZcD4DwdYZ4Fiu4LnvPA9/
 j2aOA7hyAqLGOScmyeO14zoH5RmQC8f29oLj/0bIsw5pcz1gWuuPAckUXAOXw7rFAV6W
 kbJBw1c/3Ik+wVE+p6UNnCepjM80S9OofjXUnkjOAMfS1Rh0xARle95W6oQFEDQpNhG1
 LPVewT77yrEdhcoNw4TpnOyS1/3gEEsrS/Lk/W1lRhnlH+O7ZiGRRwVkoWyUCKC9+9Vu
 bj0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVejwtutN/99ijnKrXJCe8FVA0/Or9V8+xQKoo3vGqo+DzrzB2FMka/gjw1747h7VfJICYPNcFnfoMoSn4pJg==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxJq5Rq10uta88xeuhhgzcmqS0xuEDvd5Q7rVwpCNRo97W2TZXM
 8TjQGHxL5gsn6jAfMkzEcGt/LgS4qsND5m2iEuHfYXHEgfy5wNHXhN6GxxA0uFyGQrU=
X-Gm-Gg: ASbGncsUWi0xFZCWyZ0lIKqf+YzshOYuUOrvm3VLG+f2jjh+WeCpBnOxDzQnJlqnIfl
 jrr5epKyM10CKibBqOaIeovcBKefmA9y9WwIsYQOtXlkLfzUnWGn6FUGPPuiFpvPGdPYOHMN5rQ
 wVRM2Z557mIL4yKk0GXj/Ens90DbbecKZw4WJjI+i9h/1f1B7E5uYpUI4E1+9bVFUHcPqf6R4Qs
 R9eFEseu+m8tyorV4VkVAPUpHXslRIKbOaw0ZGUw6ikwKy+9HMgNsi2iRxSvcC9I1R3mkawqZ/U
 90I6MHADsaEpuZhd7orjKKdimg+YULfvXaEQM5cBvCsgPKwZP8q5yaceFz6gioTlQ6UKoD9FneW
 J3fJAEWHahomyWWiy+QApd8knDy56WHQVBiOBl1Vh5PUf9Bi+ifb7oINTLDm4UCOEs1vaQZ4tYV
 GPuNuWj1kuJW+HHw==
X-Google-Smtp-Source: AGHT+IGt6B18Cfsh2aUtNnKQ/GdUe6r5HR9xnqzEThLvWMbBGO0PZDF86prVk/ruzgDmDAMG5bRFMQ==
X-Received: by 2002:a05:6000:310a:b0:429:bb21:94dd with SMTP id
 ffacd0b85a97d-42e0f35024amr7000231f8f.46.1764163501920; 
 Wed, 26 Nov 2025 05:25:01 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb8a29sm41169883f8f.30.2025.11.26.05.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 05:25:01 -0800 (PST)
Date: Wed, 26 Nov 2025 14:24:58 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aSb_qmjfNc1seDzb@pathway.suse.cz>
References: <20251121-printk-cleanup-part2-v2-0-57b8b78647f4@suse.com>
 <20251121-printk-cleanup-part2-v2-3-57b8b78647f4@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251121-printk-cleanup-part2-v2-3-57b8b78647f4@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2025-11-21 15:50:35, Marcos Paulo de Souza wrote: >
 The macro for_each_console_srcu iterates over all registered consoles. It's
 > implied that all registered consoles have CON_ENABLED flag set, [...] 
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
 [209.85.221.48 listed in wl.mailspike.net]
X-Headers-End: 1vOFWD-00024p-Gw
Subject: Re: [Kgdb-bugreport] [PATCH v2 3/4] printk: Use console_is_usable
 on console_unblank
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

On Fri 2025-11-21 15:50:35, Marcos Paulo de Souza wrote:
> The macro for_each_console_srcu iterates over all registered consoles. It's
> implied that all registered consoles have CON_ENABLED flag set, making
> the check for the flag unnecessary. Call console_is_usable function to
> fully verify if the given console is usable before calling the ->unblank
> callback.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

Makes sense:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
