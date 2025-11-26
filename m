Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B8AC89FE7
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 26 Nov 2025 14:22:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVuNPSGWQn5febHkZO4gDcNtlmDn+BKdi6Rocd5LY4k=; b=IQkva3KXRn1bC2RexAY6WgEKdE
	0Q5wVVqtRz11RokzO9SaY4Yof2C8/5SZ3tGo5SGIGBZRXQ0dn8om5BjhLMVFc57To/isTrPn+OAX+
	H4AXafOr8vbWf4kp7fgysJCcVs+KndGzQxGB+nnh+EgrtXNQSVE7X9uwSV4qHZLz0ojM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vOFU0-0004LP-CT
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 26 Nov 2025 13:22:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vOFTy-0004LG-Tk
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 26 Nov 2025 13:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I+mhDkufW6jQ5YRScCzzhwHbJH9j3fMQKiq5R61ePjI=; b=je8WMaamzUeUKhdmnCoT9F/2Yj
 woy8fb7PHcAD8K5qrH9w4bMXbIpNH8VRT7sPe/OsBs3LMG9J7Ay4E3rqzyA3Aj49+kUvOEDytiVLb
 4r+6Fj+7n5joy32yVd5cY6iiYsAdRlzBl5YGjFV8hgKcY3+DTwFYoIGaHmWiuJ0h1c7U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I+mhDkufW6jQ5YRScCzzhwHbJH9j3fMQKiq5R61ePjI=; b=i69sCIOymFJEJfBFLfrIVedBnV
 V2RhlJCGJT2w8S/ksVPs1nz5zo+knCHtnPvhhFhAuC3qT/AKvEpjBtBe2mAzWdj2hH2En7YtlM/he
 DRU2DxyZHQIAadx4fv+AIhnU8jdBbCSilVIB8LFk1N3/JD+PQRySNCfc8yOZSnFKDkn8=;
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vOFTy-0001xw-C4 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 26 Nov 2025 13:22:54 +0000
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-42b3c965df5so3648352f8f.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 26 Nov 2025 05:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1764163368; x=1764768168; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=I+mhDkufW6jQ5YRScCzzhwHbJH9j3fMQKiq5R61ePjI=;
 b=YxOv8897eDWBiN1H3R9WhosrstpwyHyQVAXwgnpKXg1nqRyAiG3EhRP7klu28lpWD1
 ThXhzkZNh//nvs8S067wlaMFB0+SMMnqN8OkKziirI5MrjMZiKEmectfnaAASpHoBdwF
 VJH6HLUglJs2DpdApfpAigQ4Xg2wLE2NLXllLFhNthmH85liENvBnvQYBn/MXi+ib5ZW
 L1WCEZroVSaXIwBPBbwjmwVFiQF36lKEX/W0+Dj2StBRGWL55s2SfWzRZjTMLnN7tlv0
 XZAPKze/iRhJlVf0UyZmXBAvxotgJ28ofIqfgKUwObc8EeQopxD29SvYSiE1o+TWrWuG
 vBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764163368; x=1764768168;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I+mhDkufW6jQ5YRScCzzhwHbJH9j3fMQKiq5R61ePjI=;
 b=jFjMkR4y/EZcSFmg8M5d883N3Mv2mtI4FFeSv/xTTF4KhSXPn45dey7DUCXS/65scY
 ijyZwOjQFuklC3BdFrCzr5bKIlBwecG22Jjmj25QmebznE/3MK4FkE3HbijEEQinOK4O
 d7POab7zBEAAvUGCUaDfWOKkwl2oUW9JrdzNw6w82DKiYXgJT8kxyfVqWr+eu5Bmagn3
 vqKV0WX9HaXcYRkvAbxk9IZe7ron5F0G+unwmTHEpaccthnK7BiNAkFO3jXRehgMlMRl
 e8+2ASp8bE5frecuuZh7nu+Gnf7tlA2aJ2d4n4/chT9FUCvsUw+jK2ci9vhPoiHpQdle
 b5dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGiZIM5nNpo3Kv7EL4fwUi3IdGaKTqc4ZVYAsqELm0RblexJ828t81JbdqRRHh3ZwZ6iFq4UWemAPpcYy+pQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyUfoqanTPUZCTxdHysd4utjlBnvZS79VDuil5T4xT2HiHQWyh+
 EHAIR/WIjmE8x6HXk3GOuvTJ8jgTMQFov8wyCI2O7HfvUw6OhEmIeys9zg35sKwck3c=
X-Gm-Gg: ASbGncvrqFmJCsblVxQ0OK3rtKSJQZCBw5MvJD3giu2mKST7f9ImzLV2rFujw9aEvGB
 SG4AdQ0iG6q7b3cMAJsHXhEO+G9HhfXGvinqgwtwmq8V/4d4oOuPFJir9hiIPx3OjI+JBRrvE+V
 sU95WshtmFB2O49ah9dnFrKHMBdTgAPR5VnIumsMy4mjG3JZtKgl0+X6GWCeF5qb29fZ9vAf6oQ
 GuSpohma7Cv20tpAwBDPoAbW+xUTrEbYTOs9WjuFaIJSCn03mATMs2T2HOKYa+yWAL9v1KNS3TB
 voGsfubvrYHwZJXuYEtkhmapLVScKIIlwCpjkDJM0rsq+Q2Nz74KFf5jbDJqi1oz4UQOFwHSUfn
 xBsduVAtBlQAvUrXnKa1qenkoBqYpSt7R5EVrSCL6AMv2dslN43O+aCgekbNhPIMrti+El9wjX0
 Cgi9Cw7AuBWQG5yw==
X-Google-Smtp-Source: AGHT+IGJcihhcxfNfd8mIQtL0Z/0hLrPGwpypQO8Ri9oGZbHR7NXbvwNhm6TwKmffccOm4pb+YONkw==
X-Received: by 2002:a05:6000:2288:b0:429:c4bb:fbbb with SMTP id
 ffacd0b85a97d-42e0f2129cemr6983138f8f.13.1764163367783; 
 Wed, 26 Nov 2025 05:22:47 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa3a81sm41314165f8f.26.2025.11.26.05.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 05:22:47 -0800 (PST)
Date: Wed, 26 Nov 2025 14:22:44 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aSb_JDBBX9Yh0jCM@pathway.suse.cz>
References: <20251121-printk-cleanup-part2-v2-0-57b8b78647f4@suse.com>
 <20251121-printk-cleanup-part2-v2-2-57b8b78647f4@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251121-printk-cleanup-part2-v2-2-57b8b78647f4@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2025-11-21 15:50:34, Marcos Paulo de Souza wrote: >
 All consoles found on for_each_console are registered, meaning that all >
 of them have the CON_ENABLED flag set. Since NBCON was introduced i [...]
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
 [209.85.221.50 listed in wl.mailspike.net]
X-Headers-End: 1vOFTy-0001xw-C4
Subject: Re: [Kgdb-bugreport] [PATCH v2 2/4] arch: um: kmsg_dump: Use
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

On Fri 2025-11-21 15:50:34, Marcos Paulo de Souza wrote:
> All consoles found on for_each_console are registered, meaning that all
> of them have the CON_ENABLED flag set. Since NBCON was introduced it's
> important to check if a given console also implements the NBCON callbacks.
> The function console_is_usable does exactly that.
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
