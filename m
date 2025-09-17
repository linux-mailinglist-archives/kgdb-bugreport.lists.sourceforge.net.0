Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7095B7EA02
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Sep 2025 14:55:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7NUMECR5cR5LB8a4EBcN84lCTe+jWsAB78dMafFkVI=; b=aAxZ8XC6++RDhcUNFs/+DEjZbV
	aGAcgArpk41JDbghLFJSOsrbhVNgnxEXdxrtEKdhRfCzmDTvPsDj2SLGu2zFAaspXY67P7426+rYg
	DtzvZ7wFz5THiE+ZVe7f6lOYI0mo/mHR8kvUGXqqh3iB8mdpY6yaZ8+fIsg2cv4veUWg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uynzC-00039w-C2
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 17 Sep 2025 08:57:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uynzB-00039n-3n
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 Sep 2025 08:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PjYtE4P/cQ/qbngILdovhOjF67lkoSQw3oPveSlFXiE=; b=Iuq3LIFLe0efilGeVmcLzGDYc/
 wN8KBN5VRWl3j1ehMpyxhdejKb/+7Ss6ugLKaRE1fa0cUxcH0RiG0hzNdlkGXf383rtDb10JZ5Qct
 ECgwMLSNg//emnTM1X/xYT69GM9uMY3ra8wfVlT8V+8UFM2s7BqQalC8X6CLXC7gSJW8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PjYtE4P/cQ/qbngILdovhOjF67lkoSQw3oPveSlFXiE=; b=I5Uk/uZcw6qn3DOKbiU9FZXaU3
 iqMkWmOmU9Fl5l0Mp2aLHZm0dfI8TFktFEMurKvvgTEK34E8obnRbupZenyyBmxXyGLLVeuKGtqOn
 IGDus4ZMz0Gyx+dc50hz7kbVEsgeaBaB+otQlkM6byttLNzlGgOlREOevYUNWf7l1Els=;
Received: from mail-ej1-f47.google.com ([209.85.218.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uynzA-0006oz-GN for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 Sep 2025 08:57:57 +0000
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b149efbed4eso330386666b.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 17 Sep 2025 01:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1758099465; x=1758704265; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PjYtE4P/cQ/qbngILdovhOjF67lkoSQw3oPveSlFXiE=;
 b=eHxYmTXlMLKnvvf9H2g83kqNF8fEYLwfMGdqB57ixYU92ND9L8IJgwMyPg0gAw44vn
 iRaLXKY50nG7+RPY2zTeTVYPGtE8aIyNlXZ3SrS59M2RD6DMCmBS8ldt6rywCdrp/gjz
 eTYU4ZlCPijP2KDwAaew8lDVQoYVMxYaR0mfqLpY724PB+udT7zap4zagbLSDLYkLXau
 BqCPUqtAFYdhDBagOusCHLaZZ3/nkAKGRF7CYyxOp9UC6FaP3r/gZgRkCjifLuvSdkT/
 l2AH4Rtlz1EVzseeH9wUKD7uS/e7ArZrsqiVQd2YbU1qjd8REotnTJsZ9M5tjc18jy94
 S4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758099465; x=1758704265;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PjYtE4P/cQ/qbngILdovhOjF67lkoSQw3oPveSlFXiE=;
 b=HQs5umw8cjND9YZdkt3QuSljT9RF5YOPW/pLJrZJ/lUhZiLAQU7w34iGQmlK9NhsZg
 hS5d05Pod7DZkFSg9Hc4yYYvsLiVI2C8go0tzts3TNMdlMfc0gjfodx8aApUIHjlXLR3
 A5p06Yb6VjRZ8gFWugO3l1ixpP4UpbqtHzOOXfI1RkpMMv7iaKzm7vew9vuKKNs9wmU5
 buc8QZNw8O4BQGWIGG1FCXCAESW3+SBqM0sLmupxTjiLoYMU6uvQf/ZwjQHjKz0gzn3g
 qWVXht5Yg+KHXK5QqRGUV5V1XMe2lGv7BmG+PjKTcDhza80EiLSHrmApdA9qJCS+yn9k
 U2Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhEmpGBCFAxcnZyGktnnwxMakBHEMEjsldOKEIFcbQSQ5twfC8YuQYqA8jxYcD6unA8Bgt0dh+00SdV9hwww==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxaa4lSVn5TLqL0kedMqeCh6G6QEJOy2JrE1wrHpQToWOHfeP1a
 Ibq6tSMoUeFMP0OqeofpNbTyWWlb/YyKD+Pld99ElFYH+kIoQs9NZ7SglfLtppHaE9k=
X-Gm-Gg: ASbGncurCay9UPOhrFh4JsN2nExPN8XcNgkIs0mRbddES67Yc0H4oTP9IS8X/j9q4ao
 wYvdVoCXvKqMHedtIZwTIPXWLF978B8M2zECzp8z9WPFm6xXkX2rly+kU9moM1CTDH1Xi5fbb50
 TF6fVyReRl7xybnz3wMUoHDaReQxehTNkv5G2khdjdkP0ZLKIqnEa/9l3cT1tHb/rdUgdCuYKaL
 5sIXkmO2unO5BAzPAp5V52OpasAxCkxc8v+AOdYgzbo2D3zT+H1nQjxICkyx/t0fZ/We4xS6k2d
 4CCt3Hi7F886hoW38Iee4Bp5Qy5eljirSfcgciutIYN2HXBWuCsjlh3SU57SzBvzoTjwPxuIrnf
 lFBtr03MPYKLcTAHB9lfvEIPbYQ==
X-Google-Smtp-Source: AGHT+IEisUorRyA4Lr6r4Jw3rzCrqWRztZEO/ay2mckkye3Mwe1di4sWIhKGtMj3jhznPFKqyH4Jew==
X-Received: by 2002:a17:907:6d0e:b0:b04:9822:1ab4 with SMTP id
 a640c23a62f3a-b1bb6803336mr188200266b.27.1758099464852; 
 Wed, 17 Sep 2025 01:57:44 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32dd56fsm1320000866b.65.2025.09.17.01.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 01:57:44 -0700 (PDT)
Date: Wed, 17 Sep 2025 10:57:42 +0200
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aMp4BrEpqXOW9nam@pathway.suse.cz>
References: <20250915-nbcon-kgdboc-v4-0-e2b6753bb566@suse.com>
 <20250915-nbcon-kgdboc-v4-1-e2b6753bb566@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250915-nbcon-kgdboc-v4-1-e2b6753bb566@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 2025-09-15 08:20:30, Marcos Paulo de Souza wrote: >
 The helper will be used on KDB code in the next commits. > > Reviewed-by:
 Petr Mladek <pmladek@suse.com> > Signed-off-by: Marcos Paulo de Sou [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.47 listed in wl.mailspike.net]
X-Headers-End: 1uynzA-0006oz-GN
Subject: Re: [Kgdb-bugreport] [PATCH v4 1/5] printk: nbcon: Export
 console_is_usable
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

On Mon 2025-09-15 08:20:30, Marcos Paulo de Souza wrote:
> The helper will be used on KDB code in the next commits.
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

Nit :-)

The ordering of the tags is important. It defines the timeline of
the related actions.

The above ordering might be understood as that Petr reviewed
an older version of patch. But it was later modified by Marcos.

The expected ordering is:

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>

It means that Macros developed a patch and Petr reviewed it.
The patch was not longer modified.

Note the Reviewed-by tag might be preserved even when Marcos
later did some cosmetic changes, e.g. fixed a typo, formatting,
or rebased.

Best Regards,
Petr

PS: There is no need to send v5 just because of this. I could fix
    it when committing the patch...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
