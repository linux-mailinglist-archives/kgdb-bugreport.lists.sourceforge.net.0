Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD898B81310
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Sep 2025 19:35:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flZLUNoybkg8Qag4Fi4mIsPqYYVjicKwTv+2F9zK3zE=; b=Drib4wP9q1RdZhHs5rrjh58Xck
	V4TPQ+XVa3gd20TnicwH7ufGo55Hi9Eie3VRGr1eLKvqEiNhvxEIdzaRSAtZsNdMZzCJp/Hkw56b/
	fwLyJNRSodqgOO+dBRAHuQKFcvfwp3ly/iR38q2rTmgjU8hbzD24/5lrKeghcJKf5g9Y=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uyr7H-0003hu-3f
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 17 Sep 2025 12:18:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uyr7G-0003hn-1s
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 Sep 2025 12:18:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pg7+WJItHMFq8LpEQ/3CowoGij+u8xuGzyGGUP6FSZo=; b=kZWSvuiwdfkA/gnTqfZxlq1Q8d
 QWJWICV18XIbBHS51TwcO5VPeJWfZQpVTTRqwwFa7u3UHGHbOobF0C5eh9EqLeXEq4OvYgtp7dyrP
 MwQW/43J3hgnLfTpX1MYd6UyLVy8dj8noNZdyYxGcKALjOw3kG0/ZZk7aCwznaQjdYPY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pg7+WJItHMFq8LpEQ/3CowoGij+u8xuGzyGGUP6FSZo=; b=M2+Y0R70plgHZEnZKhC8InSX13
 /0yHn2/VFEh5KO1XczalY8AREdpbUEEmGRPLx4nU1XIDvK+x7mqqaMrQWoIZG1qQFW+T+eFG0UM4H
 aRTwt1RDWXQ6xorwp/bLuzHQdxHmOHZXW9eXI5DyVr8ZiHggaz0HDI2lt0z6hWAOjAyQ=;
Received: from mail-ej1-f45.google.com ([209.85.218.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uyr7F-0002b1-OF for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 Sep 2025 12:18:30 +0000
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so1007845266b.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 17 Sep 2025 05:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1758111498; x=1758716298; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Pg7+WJItHMFq8LpEQ/3CowoGij+u8xuGzyGGUP6FSZo=;
 b=CWSFu+AVdx4ZafUngWPSpVj43rsW6w9e2Rv9bE1xXR7vW9S1Lbb/ETkp/vz3OC0MRU
 2wtyPHWbT2yK8M7nSBxjv/eZLNAAWgptxYc8rfMWE5wVOa9MITv/IZyFkfbtmpxDo5FT
 HpluLKrjaXSO+Q992Smi7hA33wsBou+l7c0o2o22VYveu0fNOOxp92wpLkvqEc1zSH3I
 e7e0BM6fodur9w9YNVdzIdJ7Z8OaTzTqim6n+qjBFCJzRg+Yf4sPiCghAYBcEJYlJnjG
 GvOUKPFJzNXImTgj5rNV8ta+E7kiyaPs04s8XHVYIGP+kzM1IG3vBfC2oVEg/57l3tow
 dQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758111498; x=1758716298;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pg7+WJItHMFq8LpEQ/3CowoGij+u8xuGzyGGUP6FSZo=;
 b=JxHZnVJBn8WOd7f4Br3jwvn1iqQ4rdPBZMh5rb51Q4oNSUaacJHvtF6it5dE4SzDd7
 Xe4V5xBEypSGZQsQPLaGiApKNh514r0BTKvIrAZ2U+3pAj2k8oq2C38TCe/cU9c4fNEo
 e18OrLZ4SpX50Z3ojGGv3C4K/wtAyh568k0kkkwB35fkLQ9uHJ6teHXQrPx3JeOx8i/L
 SeqxKgrQ3Ahs2ze7iJugAoyNnJ0tY/gnevks1vgprxcVefyGuZM5q+f01eAe6JncNpjs
 79x5RCl4snzdqJesmJmOwl5LYQwh+U6/xLxmSPfZzVjtLuyzVoTBCKhepzLInTZStN/H
 Rbjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiR7hNxv6Qu9a/FwrgW7kP7q73Fhq091DO3MPApDeF0eRYdz4jltj2++M+PyMZizoctexYXknS030GOx06oQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzRwgmJsCIpOy7Cs8656QhvmY1AC5itbklO0rincXFQbqs/rwlx
 r5puWSj8wPJS0GjtdoNDBZedxofyMqvr59+nsTg1MF1Mc01OdArdPT5n/RfNXPm5a0o=
X-Gm-Gg: ASbGncuyjRMunRImlVwMfsDkpT5eFNzehc24lNM8X/JSsJzkiLyfAURbBhBL/gkrbHW
 pJCWnAD6YkwJ78Gv4ADPwSmsVVqh/FrGyQ2/Hr77Ajy5ubWXbzA8nXd17Rgmamq8PhxskZQzv3g
 LoR/PSHE9D709k18AR5uUVpPDDkX2v993gRc0agmvMI1TgP+thVEKH4SVGL0Abmx8h6gjYjGDcI
 b/hQ7wbpQ4v3++yqE1VkuGVCJQ4PagfGM9L++cqwgl+IjuKlLUNlgMR5AZ+IkKgwD7hv6zGoooU
 z5wkRChPq0fIoQdbi7zonv5pk7HGOuoEiwJfYz0+hLYu/K/MU/0WwZ+eQTBvlHFdM9MEMeY452e
 MtEqQZk0xrvoX+HjA2Cy9/y8jiA==
X-Google-Smtp-Source: AGHT+IEb7tp1h15r3X0LhpR/A/w7KsUQunpdhfzrvEkMQYm2/zv1mPCjuFensy+wsfkrSrm28kM+qg==
X-Received: by 2002:a17:907:3fa9:b0:b04:8496:64f3 with SMTP id
 a640c23a62f3a-b1bb9268143mr230352666b.44.1758111498037; 
 Wed, 17 Sep 2025 05:18:18 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62f482a3153sm5463195a12.0.2025.09.17.05.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 05:18:17 -0700 (PDT)
Date: Wed, 17 Sep 2025 14:18:15 +0200
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aMqnB8d3A8-NBdo-@pathway.suse.cz>
References: <20250915-nbcon-kgdboc-v4-0-e2b6753bb566@suse.com>
 <20250915-nbcon-kgdboc-v4-4-e2b6753bb566@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250915-nbcon-kgdboc-v4-4-e2b6753bb566@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 2025-09-15 08:20:33, Marcos Paulo de Souza wrote: >
 This function will be used in the next patch to allow a driver to set > both
 the message and message length of a nbcon_write_context. This is [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.45 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uyr7F-0002b1-OF
Subject: Re: [Kgdb-bugreport] [PATCH v4 4/5] printk: nbcon: Export
 nbcon_write_context_set_buf
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
Cc: John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon 2025-09-15 08:20:33, Marcos Paulo de Souza wrote:
> This function will be used in the next patch to allow a driver to set
> both the message and message length of a nbcon_write_context. This is
> necessary because the function also initializes the ->unsafe_takeover
> struct member. By using this helper we ensure that the struct is
> initialized correctly.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
