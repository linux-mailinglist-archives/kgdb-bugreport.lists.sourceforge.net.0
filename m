Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JXAlGwDLMWq0qAUAu9opvQ
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Jun 2026 00:15:28 +0200
X-Original-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFF66958C2
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Jun 2026 00:15:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=fGiETBO5;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=QhvYLVQF;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=Mu8g3eET;
	dkim=fail ("body hash did not verify") header.d=chromium.org header.s=google header.b=oRxgW4Be;
	spf=pass (mail.lfdr.de: domain of kgdb-bugreport-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=kgdb-bugreport-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=chromium.org (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmP3Xz5PfIFxute1ubjzf7+fokw1sfp1PpA2ES8/fCM=; b=fGiETBO5AXi5d7PCI3u/j4MTCH
	HCaHTt4TOWQ6IWRG8IQy/0o04fGzcPx+n6xkKawIbugzDYgoVl96c2t0Ytt7iYTOKHCRhijc1LrF5
	lWCRc4kMEbxWEMES8PgVvk2yF/w2ShKX12cC08S04MH5jVQfORKKEY+vDysCW0FQjzCc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1wZc45-0001sM-JX
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 16 Jun 2026 22:15:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1wZc3u-0001rD-7r
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Jun 2026 22:15:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7tTOxgEENCoNcpDdM0TBuTKzu7V+usAzyBmcy9l52+A=; b=QhvYLVQFB1lV02fIO3Paz1y+Oq
 bdu9ms2JviPgpeYTd+6pdZ3D9M625FDvVJzQiLDoZp/lrZ2E9XfiqgkhEjSTsj6P5v5Z+DZ9Bs2S2
 xZc62u+Lx5f1L+2nxdsMXHTGohP7WzhZ+B13XjQioIeLo1X9IB93tKR6fXZJD8b3BISA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7tTOxgEENCoNcpDdM0TBuTKzu7V+usAzyBmcy9l52+A=; b=Mu8g3eET6X/DEmegrnlYuIjuxW
 TIVPHLkSrqq++b2SHLA+k0ulTGyO9tmjk9MQGg6M3P8P++mTrgLOizZF2x7X4an7zJHjZyh+3llUM
 dawZD2fvuKz84YLzDeNyw6pjtdSDy8LusRs6Rcf1JWVeSrZTP2ZuEZVa4YSictbnELU8=;
Received: from mail-qk1-f179.google.com ([209.85.222.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wZc3u-0000WZ-4T for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Jun 2026 22:15:14 +0000
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-91ae31bbaa9so227415885a.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 16 Jun 2026 15:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1781648108; x=1782252908;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7tTOxgEENCoNcpDdM0TBuTKzu7V+usAzyBmcy9l52+A=;
 b=oRxgW4Be5jwmrgpf8M+D7Vra1ojKlnJb/Br+5dNhK8lOcHnLcy6filHb1YfxbEoC3F
 TKYQeCB2hlakmH2NMnWzMfa4bSW/rLi27QjbDk7e5KETkBOfRAxLyFknY5ym0mx9vscp
 Z4c6slZVLjiynV3FuV4y8/nsFZcV4TnqRuBN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781648108; x=1782252908;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7tTOxgEENCoNcpDdM0TBuTKzu7V+usAzyBmcy9l52+A=;
 b=dzQJVCTreL9kTIMktWtULtPj832ogyFMb2Y7rtPq2POSrMDCpVNUXHJgw9gIJERlCa
 AL7Y5IosdaX0L9fdrrHQl+B0B67fWUtBhkZ2MqMrxKYsGZ9MDdDCg27u5Ep83jvdovtq
 zTNwIr/ZXm+yZT3/TCXy0urBqOM+xcWe1RVh5KkY1yh1EpU58VaMWbCc3j7PbRgpJ2pP
 VNuM+1eUWYwCWJvIX/fmBi9uJesEmsx77eY/JUfgum5JWDdHBQqnJrvbq0lsHi4HVPYr
 /riIenCN1tlEXZN6xBnsRut4ku6STKWHxFWVRDRHJ6NHzUPztPsjxRgjmQavsoRG7i8f
 Z1ZA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9qOzok+tJdW5uu3L21QgzGlTYxtjmFrWkB7ky1oQVovgjmo4qWI45Vq7EmnfZ+4q6gtatxqwQFfHM2EgKH2A==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyuZlrtj4AQQO5Sy4KAHyhOcf/D7P4w9hrlEZKD5a8MZntXifku
 jb01/IP1bb5/7OeQ9y/W6DFeL8ldP7HXGg4dMXHYGAFqGMPkfb9rE0JleINZ92/hLFGBqRREDN8
 6vwc=
X-Gm-Gg: Acq92OEDneXZv9TNY0TVvZ8illH+TutSFH236zsRbF2LQFCVOIvU6NopQseZbagdt6S
 XTU+obdEZlEFu1p0Fvc1BXlBA+hdTU8Kq1A46Qio++pj4tYnlQyhW7SkDVLvKh+x7LbIG8fMRvY
 GqC5jfs+y5b/c2lVNpke3nFZRld1FNJqSRne5lR+e81v3XS8lDROnEwyvi+UzjhHjqK+vwF+/xO
 bZ0Hw1AQfZh+6eBM180lqagJUkR9ueyCZiyiXyoUKdsIYo9WKU5VIAoUaqMASzs3Qs5OalvJgiH
 gwgthVQIvJ4Xv+OkRgg3Yycpxw+1RW6jTi3b2B9ZwkTQvxkPN0JWJTGgVmFTeuRA2NcqHnzY5Yy
 RWT+RChpU8IK5vLHhU8Qjwxpll14ibScsJstRzP2iQOdxg/oxRCdu6H93hCaZIls1jA3QPaykCH
 BCSsgJAbmKqdEh2BC3vZej27cyh+cbUUj51XWL4Y5cBeW8s7nTzJcgo+XZD7Bg8A==
X-Received: by 2002:a05:6214:409:b0:8cc:e170:de2 with SMTP id
 6a1803df08f44-8db80f468a7mr18667696d6.1.1781647613331; 
 Tue, 16 Jun 2026 15:06:53 -0700 (PDT)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com.
 [209.85.219.47]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d9f57ab4casm45992896d6.47.2026.06.16.15.06.52
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 15:06:52 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-8ce9df4732cso58232166d6.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 16 Jun 2026 15:06:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ/SbHXmxNDZN1a+YLYr09GNWzwmmBgQxZNOKyJOEo80y6Hoz/MZBWkKBN3TqqZn6TOspH/PavXw7YtXunuX6A==@lists.sourceforge.net
X-Received: by 2002:a05:6214:318d:b0:8da:cc00:fdeb with SMTP id
 6a1803df08f44-8db81ec7a86mr15102976d6.19.1781647611243; Tue, 16 Jun 2026
 15:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <uqjlxgcu6y6ukayda7jka7ji73ctkj4f3632rejud6cqqayfwx@kuyf2f2lvett>
 <20260616212029.39d35f5c@pumpkin>
In-Reply-To: <20260616212029.39d35f5c@pumpkin>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 16 Jun 2026 15:06:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wcf_bi99UKoHznq4LrZhSv9GBvMDxRLV=3oTSADrq-mA@mail.gmail.com>
X-Gm-Features: AVVi8Ce0uUISbk_N6fCHxOv1-NzqMObutfrXBt1RL-meN3QgK7tNa3j_bfhtVts
Message-ID: <CAD=FV=Wcf_bi99UKoHznq4LrZhSv9GBvMDxRLV=3oTSADrq-mA@mail.gmail.com>
To: David Laight <david.laight.linux@gmail.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Tue, Jun 16,
 2026 at 1:20 PM David Laight <david.laight.linux@gmail.com>
 wrote: > > On Tue,
 16 Jun 2026 22:14:54 +0530 > Naveen Kumar Chaudhary <naveen.osdev@gmail.com>
 wrote: > > > kdb_main.c defi [...] 
 Content analysis details:   (-0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.179 listed in wl.mailspike.net]
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wZc3u-0000WZ-4T
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: use sizeof(kdb_prompt_str)
 instead of mismatched CMD_BUFLEN
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Naveen Kumar Chaudhary <naveen.osdev@gmail.com>, danielt@kernel.org,
 linux-kernel@vger.kernel.org, jason.wessel@windriver.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[chromium.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:kgdb-bugreport@lists.sourceforge.net,m:naveen.osdev@gmail.com,m:danielt@kernel.org,m:linux-kernel@vger.kernel.org,m:jason.wessel@windriver.com,m:davidlaightlinux@gmail.com,m:naveenosdev@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,kgdb-bugreport-bounces@lists.sourceforge.net];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,chromium.org:s=google];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,chromium.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[kgdb-bugreport@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,kgdb-bugreport-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[lists.sourceforge.net,gmail.com,kernel.org,vger.kernel.org,windriver.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[kgdb-bugreport];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ADFF66958C2

SGksCgpPbiBUdWUsIEp1biAxNiwgMjAyNiBhdCAxOjIw4oCvUE0gRGF2aWQgTGFpZ2h0CjxkYXZp
ZC5sYWlnaHQubGludXhAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgMTYgSnVuIDIwMjYg
MjI6MTQ6NTQgKzA1MzAKPiBOYXZlZW4gS3VtYXIgQ2hhdWRoYXJ5IDxuYXZlZW4ub3NkZXZAZ21h
aWwuY29tPiB3cm90ZToKPgo+ID4ga2RiX21haW4uYyBkZWZpbmVzIENNRF9CVUZMRU4gYXMgMjAw
IChmb3IgY29tbWFuZCBoaXN0b3J5IGJ1ZmZlcnMpLAo+ID4gd2hpbGUga2RiX2lvLmMgZGVmaW5l
cyBpdCBhcyAyNTYgKGZvciBrZGJfcHJvbXB0X3N0cikuIFRoZSBzbnByaW50ZigpCj4gPiBmaWxs
aW5nIGtkYl9wcm9tcHRfc3RyIGluY29ycmVjdGx5IHVzZWQgdGhlIGxvY2FsIENNRF9CVUZMRU4g
KDIwMCksCj4gPiB0cnVuY2F0aW5nIHRoZSBwcm9tcHQgdW5uZWNlc3NhcmlseS4gVXNlIHNpemVv
ZihrZGJfcHJvbXB0X3N0cikgdG8KPiA+IGFsd2F5cyBtYXRjaCB0aGUgYWN0dWFsIGJ1ZmZlciBz
aXplLgo+Cj4gQXMgYSBtYXR0ZXIgb2YgaW50ZXJlc3Qgd2hhdCBzZXRzIHRoZSBzdHJpbmcgdGhh
dCBrZGJnZXRlbnYoIlBST01QVCIpCj4gcmV0dXJucz8KPiBJZiBpdCBpcyB1c2VyIHNldHRhYmxl
LCB1c2luZyBpdCBhcyBhIGZvcm1hdCBzdHJpbmcgZG9lc24ndCBzZWVtIHdpc2UKPiAoZXZlbiBm
b3Iga2RiZykuCgpGb3Igc29tZSBoaXN0b3J5LCBzZWUgY29tbWl0IGFkOTliNTEwNWMwOCAoImtk
YjogQ2Vuc29yIGF0dGVtcHRzIHRvCnNldCBQUk9NUFQgd2l0aG91dCBFTkFCTEVfTUVNX1JFQUQi
KS4KCkkgaGF2ZSBubyBpZGVhIGhvdyB0cnVseSB1c2VmdWwgaXQgaXMgdG8gYmUgYWJsZSB0byBt
ZXNzIHdpdGggeW91cgpwcm9tcHQgbGlrZSB0aGlzIHRvIGJlZ2luIHdpdGgsIGJ1dCBhdCBsZWFz
dCB0aGUgInNhZmV0eSIgb2YgaXQgaGFzCmJlZW4gY29uc2lkZXJlZCBhIGxpdHRsZS4KCi1Eb3Vn
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1i
dWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3Jl
cG9ydAo=
