Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC8552EE96
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 20 May 2022 16:59:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ns46Y-00022y-4Z
	for lists+kgdb-bugreport@lfdr.de; Fri, 20 May 2022 14:59:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jirislaby@gmail.com>) id 1nogBy-0004j3-IQ
 for kgdb-bugreport@lists.sourceforge.net; Wed, 11 May 2022 06:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1wEl4hKP70nqNM7+s33aDLROWITXXzeuUXQCyFgNxKQ=; b=LYyG0jJhsDYBo4gWaiGQHjXfAh
 +IDHhNhb28fr++NH9PLGFvGtXUcwAQLlXFONMSl4OrikjsCvH5L+n/2RBK3Oqy6YqMAwFUlA5wJq+
 s+QajnHzA4YryjEpW0UXo19OCmnqpJuN20EF9Gzv/PAav1O99ORAA71hQUKb6OJiK2+Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1wEl4hKP70nqNM7+s33aDLROWITXXzeuUXQCyFgNxKQ=; b=mHMSs/YcRhlmOKSLSyqT5UDG4f
 P/fGCKamrOioINd18aQGtsa9+4LW6FZrQU4oQxJdrJ24S6Vr3eZUtQAIYNe3GlwQxxSY6VFMNz8wh
 wDQloJMVm3ZuQqKDQAiM7Sw/fHUBTY0+NK9tzcjMILpzmlGSi2drqGiJXQUT170Ref5c=;
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nogBw-0004QQ-DI
 for kgdb-bugreport@lists.sourceforge.net; Wed, 11 May 2022 06:51:24 +0000
Received: by mail-wr1-f43.google.com with SMTP id j25so506567wrc.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 10 May 2022 23:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1wEl4hKP70nqNM7+s33aDLROWITXXzeuUXQCyFgNxKQ=;
 b=Yk1LeBYxNSl3px8PoBxUihjiREFSvdkx5VmaaTjBKljb0GD108tN4UdWqEJVP2ktc+
 xEfxfpxuW8ULU0TevyT1RDocalhQf9OjVkW4tjd+ckUF1sZKfxIq5jWnKjwldAypqQh1
 5GuQytso4oe2hykeQCx1bZ13kYpaTrcbgGU2B74SEAMv0X49iQT4UhtY3YNFzOsrLB5e
 EqoQavBkMq2Zwld11IRH8InZRM/Yf4ujxHeWVgaC43Eas3LR0LCMYH38XLIRA8VkIDQz
 aEbcG0xYwFARjTH6BtcUzHh/MsOYZZK7EBROEJdw1PNsu5uNsUU9ZvDDF76Ie1nmN+pj
 Y8qw==
X-Gm-Message-State: AOAM531RRJ8kl/ci9ed5eC7l1lDPkJlGfT2FW+kSfyauD7+SYe7fuhC9
 Vct0IxlC+sq07Py992WUNQowZqSwVumMuy2L
X-Google-Smtp-Source: ABdhPJzvSiFXK+Pkx1A+5Jgez3pwE0NnwYeWyDPJFd2IMdUv3cDPSfUbrL34eucFRES0Ji7AeRNSEg==
X-Received: by 2002:a05:6000:144a:b0:20c:6b73:804 with SMTP id
 v10-20020a056000144a00b0020c6b730804mr21963700wrx.88.1652251877878; 
 Tue, 10 May 2022 23:51:17 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a05600c424500b003942a244f3asm4242899wmm.19.2022.05.10.23.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 23:51:17 -0700 (PDT)
Message-ID: <e9a112f8-a35b-1df4-0567-9fddf80c8e17@kernel.org>
Date: Wed, 11 May 2022 08:51:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 linux-arm-kernel@lists.infradead.org, soc@kernel.org,
 linux-serial@vger.kernel.org, sumit.garg@linaro.org
References: <20220511062113.2645747-1-hasegawa-hitomi@fujitsu.com>
 <20220511062113.2645747-2-hasegawa-hitomi@fujitsu.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220511062113.2645747-2-hasegawa-hitomi@fujitsu.com>
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11. 05. 22, 8:21, Hitomi Hasegawa wrote: > --- /dev/null
 > +++ b/drivers/soc/fujitsu/a64fx-diag.c > @@ -0,0 +1,155 @@ ... > +#define
 BMC_DIAG_INTERRUPT_STATUS_OFFSET (0x0044) > +#define BMC_DIAG_IN [...] 
 Content analysis details:   (-1.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jirislaby[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.43 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.43 listed in list.dnswl.org]
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nogBw-0004QQ-DI
X-Mailman-Approved-At: Fri, 20 May 2022 14:59:49 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v4 1/1] soc: fujitsu: Add A64FX
 diagnostic interrupt driver
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
Cc: daniel.thompson@linaro.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 peterz@infradead.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 jason.wessel@windriver.com, olof@lixom.net, will@kernel.org,
 kgdb-bugreport@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 11. 05. 22, 8:21, Hitomi Hasegawa wrote:
> --- /dev/null
> +++ b/drivers/soc/fujitsu/a64fx-diag.c
> @@ -0,0 +1,155 @@
...
> +#define BMC_DIAG_INTERRUPT_STATUS_OFFSET (0x0044)
> +#define BMC_DIAG_INTERRUPT_ENABLE_OFFSET (0x0040)

And I noticed here, I would:
* remove unneeded parentheses
* drop the "_OFFSET" suffix
* just write 8bit values (0x40, 0x44), given they fit
* order them numerically, 0x40 goes first

thanks,
-- 
js
suse labs


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
