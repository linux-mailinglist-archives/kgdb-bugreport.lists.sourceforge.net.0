Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HegKBrnIMWp1qAUAu9opvQ
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Jun 2026 00:05:45 +0200
X-Original-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E03969585D
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Jun 2026 00:05:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=BcokJo6o;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Vo+IqiVX;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=jDWUCmex;
	dkim=fail ("body hash did not verify") header.d=chromium.org header.s=google header.b=GFIqtcSD;
	spf=pass (mail.lfdr.de: domain of kgdb-bugreport-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=kgdb-bugreport-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=chromium.org (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6a0xVDpZRQsxlobAzk72Zbwg2h+XJ8FoRmUUvF4+AE=; b=BcokJo6oqDBUTwQCo9MccNQ7+/
	As1t5OH9yR/Y7Bif1SszaG99YC7DcjkkKxt+YTrQSM+jQ4TYyt9Smdzp2GRzRtz5MbVF3CrD2G7VS
	L4Zp9vf0OA/ml7tUWOzlLnjJsE4Nb+6WN4gYJbLzZCVqHCarjrOR2bIIrNUWL9aUlYPc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1wZbui-0001sE-Tw
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 16 Jun 2026 22:05:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1wZbuP-0001ru-36
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Jun 2026 22:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nVHeguSsKImRrgBHA88SSveRF6dDKR4o/FSZKEjEDAY=; b=Vo+IqiVXih1bzxccznM2xRZ3ID
 t/4NNxecbw7VaLLxmYQY9znEYZbsJoeHJgfw/SfKi8He61gfJl74g9bNa+DWXalOvMasoiLHqq3Zh
 qH1fEmwgxiSEYL/OUxCutAF7GOnNU1c4YR4U85kOijHmZU/9O6nANiY81uzY5Pw3C7w4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nVHeguSsKImRrgBHA88SSveRF6dDKR4o/FSZKEjEDAY=; b=jDWUCmexDKb0mKEpo+ZauHcgSn
 zw7943Ei1unVApwYDKLByTxCtnJ4y+qx+Ar7AQM24txhtxiH6zTqZTF7uybJyHoG425lF8V7wkRGc
 fzYyZzRN8Akcr9k5wzjEyVcXchkHoyQ3giXKEbqlYivlxZBvkLiiRz/zUBShLXnF6Zm8=;
Received: from mail-ua1-f53.google.com ([209.85.222.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wZbuH-0008Gl-RK for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Jun 2026 22:05:19 +0000
Received: by mail-ua1-f53.google.com with SMTP id
 a1e0cc1a2514c-9667fd8e4ccso1080456241.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 16 Jun 2026 15:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1781647512; x=1782252312;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nVHeguSsKImRrgBHA88SSveRF6dDKR4o/FSZKEjEDAY=;
 b=GFIqtcSD8u0ThnVl+Kg5opittpSfNjTdJCKolzXQh4Z4p8qZeiIBIxhkWIOxwHf1Im
 tGOLmxNRwtECP2EAsYr3Jh9Og5bkN8HOKACI8MW5NwUG4z3Mql86LnpwVTdyi5WoA7IO
 umgPdY8i8jvphyDvvoADsPKFf6gs35HLv6/4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781647512; x=1782252312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nVHeguSsKImRrgBHA88SSveRF6dDKR4o/FSZKEjEDAY=;
 b=hZ3+DbHzDU5Kg4dvS9yk9alIZtRr9IlUMF5JnkVUhg6EEWTjpHacHmmMwQRRZiEyFb
 y7XBHuHaFAs/kaxv0FE6yw66PnHyvUubmWCGfB9Cqo1NX675u1Nr4LmN+pIVEETkXhjW
 Qx44747dWRJru73A7jkrwoukOyDshB41GyItNrW0Q/K4R+j6BvtDv/Ozp0LhuWjAbKa/
 HrvP9Y2LoHf0VHl6VV+7DK/rW/isJu2BC9IpGQk+5xSjVGmEwiJokbn3PTZJeH4rf+XY
 bLon9r/4VL23aHoAr3j6sqpuV16I4yIPdK0FXtLMzbDa3P7kz7m+HhaakG8db138mNfF
 8Rmg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8ln+Gvlpm/882IBmTTIQUCmkTUUuYS4ZN3iKH94R7IWd2q6xAqYZVNK5sP7qtZAj2IOgOLEnD82Q4lc4OjDQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwV5Ivw5ZIJkkxnDAWkUdgvPz5BTSltiyIH+B88gBkl3wRrFZRG
 N1keDtnFh0BUDxTsNCL4unFA9HdAIG0HWtLdNtYWJGbMDjWPQhMInh2qj2xjNTcQw9Z5kmSMCTu
 wEu0=
X-Gm-Gg: Acq92OEIGRV+ccMC5UwQawYfyIwuu68OPrZS/9v5f31wFfd6C4lYf/X3Qb6WIiixWmx
 IO4mKCirF4ryyL7RwKakxDBrbH1BfdAsl/fuK4RgEDxG6OcgtIKoCnWbZq+GDj8iD2bOPzzhtxV
 oKDyABZwamcK8YdAycDHEs2ETy/EBvHbodf9cJDvUwUxSec4+HetoiYLXQSie6lL7CZ3NQYWYVi
 xU5Sastaxwon/XGDjLkbz+7JcGEQBm4E7pznUDRWX6mdj5NViT2f3N2uFyH/XzxWqA2Ywvohnc4
 rv0PP1wc59fagWHlTk/Tdur+p3snues5VgGpLtnTf1A2FM6AIVm+ZD796AGVbJhzMB19PQoV/ZT
 c1oj1pQNSU78jzf8awnNPuejS46yYHOraFMoLWiVllwQynahe8L2KnXqbJiYMFzWj4fAoyZVaHW
 o8qsx9gQEEXFojABHWN7ObTou6TYYalXn0yUk75yq6E47LFyFzKX6mmMH3rQhYJQ==
X-Received: by 2002:a05:6102:3e90:b0:6d8:89a0:4ae4 with SMTP id
 ada2fe7eead31-7246c787a5amr824765137.18.1781647512356; 
 Tue, 16 Jun 2026 15:05:12 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com.
 [209.85.219.50]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d9f55c24bcsm44625416d6.46.2026.06.16.15.05.11
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 15:05:11 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-8ce3876a50cso51006286d6.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 16 Jun 2026 15:05:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ/QhcJX77Ad2VuK1OWTsro4mYi+VA7lbh/WEShQHieT5IbGWMuLb1qTWiW5DuTUwOwKCXWzV9QJv92OKl9fyA==@lists.sourceforge.net
X-Received: by 2002:a05:6214:258e:b0:8ce:a93c:e1ad with SMTP id
 6a1803df08f44-8db5e24609dmr26012216d6.32.1781647510012; Tue, 16 Jun 2026
 15:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <uqjlxgcu6y6ukayda7jka7ji73ctkj4f3632rejud6cqqayfwx@kuyf2f2lvett>
In-Reply-To: <uqjlxgcu6y6ukayda7jka7ji73ctkj4f3632rejud6cqqayfwx@kuyf2f2lvett>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 16 Jun 2026 15:04:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X4+AH5yprKR2kysg4A7uy5vHfidK_Z0AZ2z28y-k2wgw@mail.gmail.com>
X-Gm-Features: AVVi8Ce4n_v5cT9tUu8yZWhXwe2mjqkDwJlwj-t5pD_e3PPeiVA-0mkjmnuE02s
Message-ID: <CAD=FV=X4+AH5yprKR2kysg4A7uy5vHfidK_Z0AZ2z28y-k2wgw@mail.gmail.com>
To: Naveen Kumar Chaudhary <naveen.osdev@gmail.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Tue, Jun 16, 2026 at 9:45 AM Naveen Kumar Chaudhary
 <naveen.osdev@gmail.com> wrote: > > kdb_main.c defines CMD_BUFLEN as 200
 (for command history buffers), > while kdb_io.c defines it as 256 (for k [...]
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
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.53 listed in wl.mailspike.net]
X-Headers-End: 1wZbuH-0008Gl-RK
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
Cc: kgdb-bugreport@lists.sourceforge.net, danielt@kernel.org,
 linux-kernel@vger.kernel.org, jason.wessel@windriver.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[chromium.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:naveen.osdev@gmail.com,m:kgdb-bugreport@lists.sourceforge.net,m:danielt@kernel.org,m:linux-kernel@vger.kernel.org,m:jason.wessel@windriver.com,m:naveenosdev@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dianders@chromium.org,kgdb-bugreport-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,chromium.org:s=google];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,chromium.org:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[kgdb-bugreport@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,kgdb-bugreport-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[kgdb-bugreport];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:from_mime,mail.gmail.com:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E03969585D

SGksCgpPbiBUdWUsIEp1biAxNiwgMjAyNiBhdCA5OjQ14oCvQU0gTmF2ZWVuIEt1bWFyIENoYXVk
aGFyeQo8bmF2ZWVuLm9zZGV2QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBrZGJfbWFpbi5jIGRlZmlu
ZXMgQ01EX0JVRkxFTiBhcyAyMDAgKGZvciBjb21tYW5kIGhpc3RvcnkgYnVmZmVycyksCj4gd2hp
bGUga2RiX2lvLmMgZGVmaW5lcyBpdCBhcyAyNTYgKGZvciBrZGJfcHJvbXB0X3N0cikuIFRoZSBz
bnByaW50ZigpCj4gZmlsbGluZyBrZGJfcHJvbXB0X3N0ciBpbmNvcnJlY3RseSB1c2VkIHRoZSBs
b2NhbCBDTURfQlVGTEVOICgyMDApLAo+IHRydW5jYXRpbmcgdGhlIHByb21wdCB1bm5lY2Vzc2Fy
aWx5LiBVc2Ugc2l6ZW9mKGtkYl9wcm9tcHRfc3RyKSB0bwo+IGFsd2F5cyBtYXRjaCB0aGUgYWN0
dWFsIGJ1ZmZlciBzaXplLgo+Cj4gU2lnbmVkLW9mZi1ieTogTmF2ZWVuIEt1bWFyIENoYXVkaGFy
eSA8bmF2ZWVuLm9zZGV2QGdtYWlsLmNvbT4KPiAtLS0KPiAga2VybmVsL2RlYnVnL2tkYi9rZGJf
bWFpbi5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEva2VybmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5jIGIv
a2VybmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5jCj4gaW5kZXggZGRjZTU2YjQ3YjI1Li41NzFlOWU2
MWI0MGUgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5jCj4gKysrIGIv
a2VybmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5jCj4gQEAgLTEyNjUsOCArMTI2NSw4IEBAIHN0YXRp
YyBpbnQga2RiX2xvY2FsKGtkYl9yZWFzb25fdCByZWFzb24sIGludCBlcnJvciwgc3RydWN0IHB0
X3JlZ3MgKnJlZ3MsCj4KPiAgZG9fZnVsbF9nZXRzdHI6Cj4gICAgICAgICAgICAgICAgIC8qIFBS
T01QVCBjYW4gb25seSBiZSBzZXQgaWYgd2UgaGF2ZSBNRU1fUkVBRCBwZXJtaXNzaW9uLiAqLwo+
IC0gICAgICAgICAgICAgICBzbnByaW50ZihrZGJfcHJvbXB0X3N0ciwgQ01EX0JVRkxFTiwga2Ri
Z2V0ZW52KCJQUk9NUFQiKSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgcmF3X3NtcF9wcm9j
ZXNzb3JfaWQoKSk7Cj4gKyAgICAgICAgICAgICAgIHNucHJpbnRmKGtkYl9wcm9tcHRfc3RyLCBz
aXplb2Yoa2RiX3Byb21wdF9zdHIpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICBrZGJnZXRl
bnYoIlBST01QVCIpLCByYXdfc21wX3Byb2Nlc3Nvcl9pZCgpKTsKCkhtbW0sIEkgZG9uJ3QgdGhp
bmsgc28uIE15IGNvbXBpbGVyIHllbGxzIGF0IG1lIGZvciB0aGF0OgoKICBJbnZhbGlkIGFwcGxp
Y2F0aW9uIG9mICdzaXplb2YnIHRvIGFuIGluY29tcGxldGUgdHlwZQonY2hhcltdJ2NsYW5nKHNp
emVvZl9hbGlnbm9mX2luY29tcGxldGVfb3Jfc2l6ZWxlc3NfdHlwZSkKCi4uLndoaWNoIG1ha2Vz
IHNlbnNlIHNpbmNlIHRoZSB2YXJpYWJsZSBpcyBkZWZpbmVkIGluIGEgZGlmZmVyZW50CnNvdXJj
ZSBmaWxlIGFuZCB0aGUgaGVhZGVyIGhhczoKCmtlcm5lbC9kZWJ1Zy9rZGIva2RiX3ByaXZhdGUu
aDpleHRlcm4gY2hhciBrZGJfcHJvbXB0X3N0cltdOwoKU28gdGhlcmUncyBhIGJ1ZyB0byBmaXgs
IGJ1dCBJIGRvbid0IHRoaW5rIHlvdXIgZml4IGlzIHF1aXRlIHJpZ2h0LgpJbnN0ZWFkLCBtYXli
ZSB5b3Ugc2hvdWxkIGhhdmUgYSBzaW5nbGUgI2RlZmluZSB0aGF0J3MgaW4gYSBoZWFkZXIgYW5k
CnVzZWQgYnkgYm90aCBmaWxlcz8KCgotRG91ZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1
Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
