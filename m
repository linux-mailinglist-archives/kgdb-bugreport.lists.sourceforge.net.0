Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5002FB7DFD6
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Sep 2025 14:39:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlY8ZGm4nIExnZ4XvjCj1RE8mTzO7xaow+NzukCo4CU=; b=RmWtsEuQATYqoGEaauFOihN4MU
	VmOiRU5om6LjB8yZxzFGu9vZoQUzwyxAR29UvtlR5EpuAepzHS3ahDBXe6ZlYqAnLAFfFr82T13aS
	U6Jda+1z75usAWIQpb7OmZFuknQgF1E7jpcENQIpYdX4izZnE6XKRrM1QqzXmfRhgix8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uyq9g-0005IL-NI
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 17 Sep 2025 11:16:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uyq9f-0005IF-Fl
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 Sep 2025 11:16:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y5+QCfd7AnWxO1Uiu+yxEm6oSJQvuzcwXael9gAjARo=; b=V088m05c8ARQxY85FX7rw/QUjv
 2VBjG2//WZcc0xpc/kMxTlasuC0lNBHxy+JsiCW4lk6wYRQYedsFeJLaeSwcYF1E8Rh+7twxRr34q
 uIiPq73/MPg1rgoNuyrkwPB92nIMAUTZQ/2IQ5znoMTZqqYcMm2bWHxXxevcAw0Z9Yqs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y5+QCfd7AnWxO1Uiu+yxEm6oSJQvuzcwXael9gAjARo=; b=PnlyQIrZ5rDa43HyqyydGLhNyK
 KG4kOiXwtWVf1xlg97+9ZA3cXAuH8Zv1rRSjLPjwoMnG1+AKVAN0BNrMH9hbiq6Vr5yHmKZoKcwnf
 CijX/GCTahbLsmGhkEkEI4mbqgmDftFm/TbwMmgdvhppgMzJ4j3y/+rE/tcJUn7Rf7ZQ=;
Received: from mail-ej1-f42.google.com ([209.85.218.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uyq9f-0007RQ-5X for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 Sep 2025 11:16:55 +0000
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b149efbed4eso349409766b.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 17 Sep 2025 04:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1758107803; x=1758712603; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y5+QCfd7AnWxO1Uiu+yxEm6oSJQvuzcwXael9gAjARo=;
 b=hB9wqmqxbbFX8BEuAy8itiyKYykPK8tlpzpPJ3mh1CdgvzHdZ4WMLGj7p3DYGFwyDq
 jUjLVMRr8xWV4rlVsJNatWsTVMhlXElBI7ir4djqYDHoxn/YZkT+4Ef9+XwFXH4r0N6a
 am/kj+s7k9YC9fHUm0kGb8Tj8zXv7hOGg8wPU+Pe7ZzOV1T31QP5lkx+3/i+cT9yg97Z
 DRSZE4cm3zGj5+wHEYjhOiNQysJ05rCXJkwcm2/t6kEcTuzdXexNvHkTXDyrvyizJzju
 u6zHof/6fHsv+jC5ypiBpLZxisLpi3xzzzkCbuBII+MozD0StUjjDiew4bWCJ/zefOL/
 Srdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758107803; x=1758712603;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y5+QCfd7AnWxO1Uiu+yxEm6oSJQvuzcwXael9gAjARo=;
 b=ZWSArUOJ78HS142YPgQgdQRI+4/D913qvCtrXSUjUVTxXMmBL6Cld31r/LWpYXlggr
 8ZnxAxnS4h2YQAyU/i30sMq10GhToS5RKUkUiXzsAv/V3vS4uQiQr5+RWFeHrqMyQC/h
 iJkBw31VWo5nvxvidC0U2MfWXXfbLoJXhqDJPvUTKonAgwQlTCxjYh7m54nUgrtj3/Y9
 sE97y9hK/06lwA1/eEabb8xaSKRPEPVEpLHf3JK+SM1PcWjWh5jjxuxxZ4eCvBGW1hkd
 caKW6tTX7nUtrXNCSaJm9uLPtNFWr5D+qdbqF9gRGCJyBh5xrHz8ZaqTg+FtJCfXaXa2
 stqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8R85RO93/7UmRfbPBYaSha2O8QtFDVEZva7Y+FmWb5g+2f2gQPkdJPqdzJkW9SuFwqNKC6ESFmUX4l06UtA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyjc+DSuOnUliKGlI1a/pChNJONxkQsZY9wMS0eADGtR4giSrtH
 voYO/313Yk8OJnrOSWyVcOqdEggRjPDLtbLErh8VsVSha3y3gVHphpY0WiNhCGhRCC0=
X-Gm-Gg: ASbGncuRGnvkxHYbq+i164RxLXLXnYj/mSAYjlqysArHzBY8MD9TwPiQ3Es5Zd3ewpC
 nNan6G5WWuKbWg+VgXgRyW9tCFGlewfc8/7S7c7c+Ko6CyaVCmXXN6AM9qFO/NowZyurVgWrb8P
 I0c83urlfRcWb04zTz9An4k5QO/8QVbHsqpE1yN0MBgVCdmYu0rwohbupm0Yt6O0qATkXgEFo3T
 micCNO6TrEKMYKqdgNWEZ68v6uFunQTTvhhtr9afFYmgXlsUKJ/t4LZF0MneTzsy4paeEsFfsB1
 kNIn8xxs61zp3jMrLmPJdZKqmR8uxBUXkFGRWvlWkpcMYUCQbePZFpjAUg7atQJFyrJMHjiZhAI
 MpbrG/oB7y5R8PxMq9+Iq7rlfITwfaPIZrFG/
X-Google-Smtp-Source: AGHT+IFZy3mrCBpGywWYVRXU0ddDyLdCUVYtaMmLkV94TwlEwWXV8sRWsTgucNxGxD0epFiNoK0USQ==
X-Received: by 2002:a17:906:dc91:b0:b04:48c5:340 with SMTP id
 a640c23a62f3a-b1bb43380a7mr171298366b.9.1758107803558; 
 Wed, 17 Sep 2025 04:16:43 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32f22b1sm1361332966b.86.2025.09.17.04.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 04:16:43 -0700 (PDT)
Date: Wed, 17 Sep 2025 13:16:41 +0200
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aMqYmaqMSohDluhZ@pathway.suse.cz>
References: <20250915-nbcon-kgdboc-v4-0-e2b6753bb566@suse.com>
 <20250915-nbcon-kgdboc-v4-2-e2b6753bb566@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250915-nbcon-kgdboc-v4-2-e2b6753bb566@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 2025-09-15 08:20:31, Marcos Paulo de Souza wrote: >
 These helpers will be used when calling console->write_atomic on > KDB code
 in the next patch. It's basically the same implementation > as nb [...] 
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
 [209.85.218.42 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uyq9f-0007RQ-5X
Subject: Re: [Kgdb-bugreport] [PATCH v4 2/5] printk: nbcon: Introduce KDB
 helpers
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

On Mon 2025-09-15 08:20:31, Marcos Paulo de Souza wrote:
> These helpers will be used when calling console->write_atomic on
> KDB code in the next patch. It's basically the same implementation
> as nbcon_device_try_acquire, but using NBCON_PRIO_EMERGENCY when
> acquiring the context.
> 
> If the acquire succeeds, the message and message length are assigned to
> nbcon_write_context so ->write_atomic can print the message.
> 
> After release try to flush the console since there may be a backlog of
> messages in the ringbuffer. The kthread console printers do not get a
> chance to run while kdb is active.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
